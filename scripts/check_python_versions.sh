#!/usr/bin/env bash
set -euo pipefail

# Check available Python versions and their compatibility with SDF framework

echo "=== Python Version Check for SDF Framework ==="
echo ""

# Function to check Python version and compatibility
check_python() {
    local python_cmd="$1"
    local description="$2"
    
    if command -v "$python_cmd" >/dev/null 2>&1; then
        local version=$("$python_cmd" --version 2>&1 | cut -d' ' -f2)
        local location=$(which "$python_cmd")
        
        echo "✅ $description:"
        echo "   Command: $python_cmd"
        echo "   Version: $version"
        echo "   Location: $location"
        
        # Check compatibility
        if [[ "$python_cmd" == "python3.11" ]]; then
            echo "   Status: 🟢 FULLY COMPATIBLE (supports all tools including CharLib)"
        elif [[ "$python_cmd" == "python3.10" ]]; then
            echo "   Status: 🟡 PARTIALLY COMPATIBLE (supports lctime and libretto, but not CharLib)"
        elif [[ "$python_cmd" == "python3" ]]; then
            echo "   Status: 🟡 PARTIALLY COMPATIBLE (version may vary)"
        else
            echo "   Status: 🔴 UNKNOWN COMPATIBILITY"
        fi
        echo ""
        return 0
    else
        echo "❌ $description: Not found"
        echo ""
        return 1
    fi
}

# Check different Python versions
echo "Checking available Python versions..."
echo ""

check_python "python3.11" "Python 3.11 (Recommended)"
check_python "python3.10" "Python 3.10"
check_python "python3" "Python 3 (Generic)"
check_python "python" "Python (Generic)"

echo "=== Tool Compatibility Summary ==="
echo ""

# Check if Python 3.11 is available for CharLib
if command -v python3.11 >/dev/null 2>&1; then
    echo "✅ CharLib: Available (requires Python 3.11+)"
else
    echo "❌ CharLib: Not available (requires Python 3.11+)"
    echo "   Run: ./scripts/install_python311.sh"
fi

# Check if Python 3.10+ is available for lctime and libretto
if command -v python3.10 >/dev/null 2>&1 || command -v python3.11 >/dev/null 2>&1; then
    echo "✅ lctime: Available (requires Python 3.10+)"
    echo "✅ libretto: Available (requires Python 3.10+)"
else
    echo "❌ lctime: Not available (requires Python 3.10+)"
    echo "❌ libretto: Not available (requires Python 3.10+)"
fi

echo ""
echo "=== Recommendations ==="
echo ""

if command -v python3.11 >/dev/null 2>&1; then
    echo "🎉 You have Python 3.11! You can use ALL characterization tools."
    echo "   Recommended setup:"
    echo "   python3.11 -m venv venv"
    echo "   source venv/bin/activate"
    echo "   ./scripts/install_sdf_deps.sh"
    echo "   ./scripts/install_charlib.sh"
    echo "   ./scripts/install_lctime.sh"
    echo "   ./scripts/install_libretto.sh"
elif command -v python3.10 >/dev/null 2>&1; then
    echo "⚠️  You have Python 3.10. You can use lctime and libretto, but not CharLib."
    echo "   To enable CharLib, run: ./scripts/install_python311.sh"
    echo ""
    echo "   Current setup:"
    echo "   python3.10 -m venv venv"
    echo "   source venv/bin/activate"
    echo "   ./scripts/install_sdf_deps.sh"
    echo "   ./scripts/install_lctime.sh"
    echo "   ./scripts/install_libretto.sh"
else
    echo "❌ No suitable Python version found."
    echo "   Please install Python 3.10+ or run: ./scripts/install_python311.sh"
fi
