# Awesome SystemVerilog UVM

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/)
[![SystemVerilog](https://img.shields.io/badge/SystemVerilog-UVM-green.svg)](https://accellera.org/)

> A comprehensive one-stop hub for learning Universal Verification Methodology (UVM), accessing powerful verification tools, and exploring reference designs.

## 📚 Overview

This repository serves as a centralized resource for SystemVerilog UVM verification engineers, providing:

- **📖 Learning Materials**: Curated tutorials, primers, and reference guides
- **🛠️ Development Tools**: Essential tools for UVM verification workflow
- **🎯 Reference Designs**: Production-ready verification components and examples

## 🚀 Quick Start

### Prerequisites
- Python 3.7+
- SystemVerilog simulator (QuestaSim, VCS, Xcelium, or similar)
- Git for submodule management

### Installation

```bash
# Clone the repository with submodules
git clone --recursive https://github.com/your-username/awesome-systemverilog-uvm.git
cd awesome-systemverilog-uvm

# Initialize submodules if not done during clone
git submodule update --init --recursive
```

## 📖 Learning Resources

Dive into UVM with our curated collection of learning materials:

### 📚 Core UVM Learning
- **[UVM Reference](learnings/UVMReference/)** - Official Accellera UVM reference implementation and documentation
- **[UVM Primer](learnings/uvmprimer/)** - Ray Salemi's comprehensive UVM tutorial series
- **[Learn UVM PyUVM](learnings/learn_uvm_pyuvm/)** - Integrated learning materials for both SystemVerilog UVM and PyUVM

### 🐍 Python for Verification
- **[Python4RTLVerification](learnings/Python4RTLVerification/)** - Python techniques for RTL verification workflows

### 🔧 FPGA Simulation
- **[FPGASimulation](learnings/fpgasimulation/)** - FPGA-specific simulation methodologies and best practices

## 🛠️ Development Tools

Accelerate your verification workflow with these powerful tools:

### 🔄 Language Translation
- **[PyUVM SV-UVM Translator](tools/pyuvm_svuvm_translator/)** - Seamless translation between PyUVM and SystemVerilog UVM components

### 📊 Code Analysis
- **[PyUVM Analyzer](tools/pyuvm_analyzer/)** - Static analysis and optimization tools for PyUVM codebases
- **[PySystemVerilog Analyzer](tools/pysystemverilog_analyzer/)** - Advanced analysis tools for SystemVerilog verification code

### 🐍 Python-Based Verification
- **[Cocotb](tools/cocotb/)** - Python-based hardware verification framework with coroutine support

## 🎯 Reference Designs

### AXI Protocol Verification
**[UVM AXI](designs/uvm_axi/)** - Complete AXI protocol verification environment featuring:

- **AXI BFM** with comprehensive protocol checking
- **Virtual Master/Slave** components for flexible test scenarios
- **Protocol Checker** supporting:
  - Read/Write phase validation
  - ID tag mapping verification
  - Transfer integrity checks
- **TLM Analysis Ports** for third-party integration
- **DPI/PLI Interfaces** for system-level verification
- **Ready-to-run Examples** with Python automation scripts

#### Quick AXI Demo

```bash
cd designs/uvm_axi
python run.py  # Runs the virtual master to DUT slave example
```

## 📋 Directory Structure

```
awesome-systemverilog-uvm/
├── learnings/              # Educational resources and tutorials
│   ├── UVMReference/       # Official UVM reference materials
│   ├── uvmprimer/          # UVM primer tutorials
│   ├── learn_uvm_pyuvm/    # Integrated UVM/PyUVM learning
│   ├── Python4RTLVerification/  # Python verification techniques
│   └── fpgasimulation/     # FPGA simulation resources
├── tools/                  # Development and analysis tools
│   ├── cocotb/            # Python verification framework
│   ├── pyuvm_svuvm_translator/  # Language translation tools
│   ├── pyuvm_analyzer/     # PyUVM analysis utilities
│   └── pysystemverilog_analyzer/  # SystemVerilog analysis tools
└── designs/               # Reference verification environments
    └── uvm_axi/           # AXI protocol verification suite
```

## 🎓 Learning Path

### Beginner Level
1. Start with **[UVM Primer](learnings/uvmprimer/)** for foundational concepts
2. Explore **[Python4RTLVerification](learnings/Python4RTLVerification/)** for modern verification approaches
3. Try the **[AXI examples](designs/uvm_axi/examples/)** to see UVM in action

### Intermediate Level
1. Study the **[UVM Reference](learnings/UVMReference/)** implementation
2. Learn **[PyUVM](learnings/learn_uvm_pyuvm/)** for Python-based verification
3. Experiment with **[Cocotb](tools/cocotb/)** for advanced test scenarios

### Advanced Level
1. Use analysis tools (**[PyUVM Analyzer](tools/pyuvm_analyzer/)**, **[PySystemVerilog Analyzer](tools/pysystemverilog_analyzer/)**) for code optimization
2. Leverage the **[Translator](tools/pyuvm_svuvm_translator/)** for cross-language development
3. Build custom verification environments using the reference designs

## 🤝 Contributing

We welcome contributions to enhance this verification ecosystem!

### Adding New Resources
1. Fork the repository
2. Add your learning material, tool, or design as a submodule
3. Update this README with appropriate documentation
4. Submit a pull request

### Guidelines
- Ensure all submodules have proper licensing
- Include comprehensive documentation
- Add practical examples where applicable
- Test integration with existing tools

## 📄 License

This repository contains multiple submodules with their own licenses. Please refer to each submodule's license file for specific terms.

## 🙏 Acknowledgments

- **Accellera** for the UVM standard
- **Ray Salemi** for educational content and tutorials
- **Cocotb Community** for Python-based verification framework
- **SJTU-YONGFU-RESEARCH-GRP** for specialized UVM tools
- **Verification Excellence** for UVM reference materials

## 📞 Support

- 📧 **Issues**: [GitHub Issues](https://github.com/your-username/awesome-systemverilog-uvm/issues)
- 📖 **Documentation**: Check individual submodule READMEs for detailed usage
- 💬 **Discussions**: [GitHub Discussions](https://github.com/your-username/awesome-systemverilog-uvm/discussions)

---

*Empowering the verification community with comprehensive UVM resources and tools.*
