#!/usr/bin/env bash
set -euo pipefail

# Create a project-local virtualenv if it doesn't exist and upgrade pip
# This script prefers Python 3.11 if available, falls back to Python 3.10

echo "Setting up Python virtual environment..."

# Function to check Python version
check_python_version() {
    local python_cmd="$1"
    if command -v "$python_cmd" >/dev/null 2>&1; then
        local version=$("$python_cmd" --version 2>&1 | cut -d' ' -f2)
        echo "Found $python_cmd: $version"
        return 0
    else
        echo "$python_cmd not found"
        return 1
    fi
}

# Determine which Python to use (prefer 3.11, fallback to 3.10, then 3)
PYTHON_CMD=""
if check_python_version "python3.11"; then
    PYTHON_CMD="python3.11"
    echo "✅ Using Python 3.11 for virtual environment"
elif check_python_version "python3.10"; then
    PYTHON_CMD="python3.10"
    echo "⚠️  Using Python 3.10 (Python 3.11 recommended for CharLib support)"
elif check_python_version "python3"; then
    PYTHON_CMD="python3"
    echo "⚠️  Using Python 3 (version may not support all tools)"
else
    echo "❌ Error: No suitable Python version found!"
    echo "Please install Python 3.10+ or run: ./scripts/install_python311.sh"
    exit 1
fi

# Create virtual environment if it doesn't exist
VENV_DIR="venv"
if [[ ! -d "$VENV_DIR" ]]; then
    echo "Creating virtual environment with $PYTHON_CMD..."
    "$PYTHON_CMD" -m venv "$VENV_DIR"
else
    echo "Virtual environment already exists at $VENV_DIR"
fi

# Activate virtual environment
echo "Activating virtual environment..."
source "./$VENV_DIR/bin/activate"

# Pick a python executable inside the venv (python or python3)
PY_BIN="python"
if ! command -v "$PY_BIN" >/dev/null 2>&1; then
    PY_BIN="python3"
fi

# Upgrade pip and install basic packages
echo "Upgrading pip and installing basic packages..."
"$PY_BIN" -m pip install --upgrade pip setuptools wheel

echo "✅ Virtual environment ready at $VENV_DIR (Python: $($PY_BIN -V))"

# Check if we're using Python 3.11 for CharLib compatibility
if [[ "$PYTHON_CMD" == "python3.11" ]]; then
    echo "✅ Python 3.11 detected - CharLib will be available"
else
    echo "⚠️  Note: CharLib requires Python 3.11+. Run './scripts/install_python311.sh' to install it."
fi
