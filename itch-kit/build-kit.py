from pathlib import Path
from zipfile import ZipFile, ZIP_DEFLATED

root = Path(__file__).resolve().parent
with ZipFile(root / "PlaySpace-Itch-HTML.zip", "w", ZIP_DEFLATED) as archive:
    for file in [root / "index.html", *sorted((root / "assets").glob("*"))]:
        archive.write(file, file.relative_to(root))
with ZipFile(root / "PlaySpace-Itchio-Release-Kit.zip", "w", ZIP_DEFLATED) as archive:
    for name in ["PlaySpace-Itch-HTML.zip", "index.html", "cover.png", "header.png", "playspace-screenshot.png", "itch-description.md", "UPLOAD-INSTRUCTIONS.txt"]:
        archive.write(root / name, name)
    for file in sorted((root / "assets").glob("*")):
        archive.write(file, file.relative_to(root))
print("Built browser upload and complete itch.io release kit.")
