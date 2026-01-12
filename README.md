# PROJECT-ALL-TOMMOROW
echo "# PROJECT-ALL-TOMMOROW" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/masoncervantes30-boop/PROJECT-ALL-TOMMOROW.git
git push -u origin main

---

## Quick start (Python CLI)

1. Create a virtual environment (optional but recommended):

   python -m venv .venv
   source .venv/bin/activate   # on Windows use `.venv\Scripts\activate`

2. Install dependencies:

   pip install -r requirements.txt

3. Run the example:

   python hello.py

4. Run tests:

   pytest
---

## Codespaces / Dev Container (optional) 🐳

This repo includes a `.devcontainer` that uses a Python dev container image and automatically installs `requirements.txt` after the container is created.

To open the repo in a Codespace or container:

- In GitHub: click **Code ▶ Open with Codespaces** (or **Open in Container** in VS Code).
- The container forwards port `8000` (useful if you later add a web server).

When the container finishes setup, dependencies will be installed automatically and you'll be ready to run `python hello.py` and `pytest`.
