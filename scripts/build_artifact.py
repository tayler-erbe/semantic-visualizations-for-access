"""Build self-contained copies of the brief (CSS and JS inlined).

The GitHub Pages version in brief/ links styles.css, site.css, brief.css and brief.js.
Hosts that only serve single files (such as a Claude artifact) need everything inline.

Usage: python scripts/build_artifact.py OUTPUT_DIR
Writes OUTPUT_DIR/index.html (page body only, for an artifact host that adds its own
document skeleton) and OUTPUT_DIR/evidence.html (a complete document).
"""
import pathlib
import re
import sys

root = pathlib.Path(__file__).resolve().parent.parent / "brief"
out = pathlib.Path(sys.argv[1])
out.mkdir(parents=True, exist_ok=True)

css = "\n".join((root / f).read_text() for f in ("styles.css", "site.css", "brief.css"))
js = (root / "brief.js").read_text()


def inline(html: str) -> str:
    html = re.sub(r'<link rel="icon"[^>]*>', "", html)
    html = re.sub(r'<link rel="stylesheet" href="(styles|site|brief)\.css">', "", html)
    html = html.replace("</head>", "<style>\n" + css + "\n</style>\n</head>", 1)
    html = html.replace('<script src="brief.js" defer></script>', "")
    if 'id="hero-figure"' in html:
        html = html.replace("</body>", "<script>\n" + js + "\n</script>\n</body>", 1)
    return html.replace('href="index.html"', 'href="./"')


index = inline((root / "index.html").read_text())
# Artifact page: drop the document wrapper, keep title and style at the top.
title = re.search(r"<title>.*?</title>", index, re.S).group(0)
title = "<title>" + re.sub(r"<.*?>", "", title).split(" · ")[0] + "</title>"
style = re.search(r"<style>.*?</style>", index, re.S).group(0)
body = re.search(r"<body>(.*)</body>", index, re.S).group(1)
(out / "index.html").write_text(f"{title}\n{style}\n{body}")
(out / "evidence.html").write_text(inline((root / "evidence.html").read_text()))
print("wrote", out / "index.html", "and", out / "evidence.html")
