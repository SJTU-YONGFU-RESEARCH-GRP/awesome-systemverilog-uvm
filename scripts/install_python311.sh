#!/usr/bin/env bash
set -euo pipefail

# Install Python 3.11 if not available
# This script checks for Python 3.11 and installs it using the deadsnakes PPA if needed

echo "Checking for Python 3.11..."

# Function to check if Python 3.11 is available
check_python311() {
    if command -v python3.11 >/dev/null 2>&1; then
        PYTHON_VERSION=$(python3.11 --version 2>&1 | cut -d' ' -f2)
        echo "✅ Python 3.11 found: $PYTHON_VERSION"
        return 0
    else
        echo "❌ Python 3.11 not found"
        return 1
    fi
}

# Function to install Python 3.11
install_python311() {
    echo "Installing Python 3.11..."
    
    # Update package lists
    echo "Updating package lists..."
    sudo apt update
    
    # Install required packages
    echo "Installing required packages..."
    sudo apt install -y software-properties-common
    
    # Add deadsnakes PPA for Python 3.11
    echo "Adding deadsnakes PPA..."
    sudo add-apt-repository ppa:deadsnakes/ppa -y
    
    # Update package lists again
    echo "Updating package lists after adding PPA..."
    sudo apt update
    
    # Install Python 3.11 and related packages
    echo "Installing Python 3.11..."
    sudo apt install -y python3.11 python3.11-venv python3.11-dev
    
    echo "✅ Python 3.11 installation completed!"
}

# Function to verify installation
verify_installation() {
    if check_python311; then
        echo "✅ Python 3.11 is ready to use!"
        echo "Version: $(python3.11 --version)"
        echo "Location: $(which python3.11)"
        return 0
    else
        echo "❌ Python 3.11 installation failed!"
        return 1
    fi
}

# Main execution
main() {
    echo "=== Python 3.11 Installation Script ==="
    echo "This script will check for Python 3.11 and install it if needed."
    echo ""
    
    # Check if Python 3.11 is already available
    if check_python311; then
        echo ""
        echo "🎉 Python 3.11 is already installed and ready to use!"
        echo "You can now create a virtual environment with:"
        echo "  python3.11 -m venv venv"
        echo "  source venv/bin/activate"
        return 0
    fi
    
    echo ""
    echo "Python 3.11 is not installed. Installing now..."
    echo "This will require sudo privileges."
    echo ""
    
    # Check if running on Ubuntu/Debian
    if ! command -v apt >/dev/null 2>&1; then
        echo "❌ Error: This script is designed for Ubuntu/Debian systems."
        echo "Please install Python 3.11 manually for your system."
        exit 1
    fi
    
    # Install Python 3.11
    install_python311
    
    # Verify installation
    echo ""
    if verify_installation; then
        echo ""
        echo "🎉 Python 3.11 installation successful!"
        echo ""
        echo "Next steps:"
        echo "1. Create a new virtual environment:"
        echo "   python3.11 -m venv venv"
        echo ""
        echo "2. Activate the virtual environment:"
        echo "   source venv/bin/activate"
        echo ""
        echo "3. Install SDF dependencies:"
        echo "   ./scripts/install_sdf_deps.sh"
        echo ""
        echo "4. Install characterization tools:"
        echo "   ./scripts/install_charlib.sh"
        echo "   ./scripts/install_lctime.sh"
        echo "   ./scripts/install_libretto.sh"
    else
        echo "❌ Installation verification failed!"
        exit 1
    fi
}

# Run main function
main "$@"
