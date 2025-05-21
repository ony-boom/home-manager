import os
import importlib.util
from pathlib import Path
from urllib.request import urlopen

home_dir = Path.home()
theme_dir = home_dir / ".local" / "share" / "qutebrowser"
theme_dir.mkdir(parents=True, exist_ok=True)

theme_path = theme_dir / "theme.py"

if not theme_path.exists():
    theme_url = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme_url) as response:
        theme_code = response.read().decode("utf-8")
        with open(theme_path, "w") as file:
            file.write(theme_code)

if theme_path.exists():
    spec = importlib.util.spec_from_file_location("theme", theme_path)
    theme = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(theme)
    theme.setup(c, 'mocha', True)

c.tabs.padding = {'top': 6, 'bottom': 6, 'left': 8, 'right': 8}
