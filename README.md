
# Sandbox Evasion Detection Script

## Overview
---

This PowerShell script is part of a cybersecurity research project exploring **sandbox evasion techniques through environmental fingerprinting**. The script detects sandbox indicators—such as specific DLL files, known directory structures, and file hashes—and terminates execution upon detection. This approach contributes to the study of anti-sandbox methodologies by analyzing how analysis environments can be identified and bypassed.

There are three PowerShell binaries with different levels of obfuscation to simulate a real threat actor:
- `cuckouniversal.ps1` – The **source code**.
- `UniversalCuckooRandomNames.ps1` – A **binary with randomized variable and function names**.
- A third version that **uses a Base64 payload** to decode the source code.

In a real environment, a threat actor would likely specify a **secondary payload** in cases where no detections are found. However, for ethical reasons, this script **only shuts down the computer if it detects `cuckoomon.dll` and other fragments**. 

⚠️ **Warning:** Make sure to **save any work** before running the script. If experimenting with it, consider modifying the shutdown mechanism.

---
## Features
- **DLL Detection:** Searches for the presence of `cuckoomon.dll`, a common indicator of sandbox environments like Cuckoo Sandbox.
- **Hash Detection:** Compares file hashes against a predefined list associated with virtualized or analysis environments.
- **Directory Detection:** Identifies storage directories used in malware analysis sandboxes.
- **Exit Mechanism:** If any indicators are detected, the system shuts down to prevent further execution.

## Research Focus
- **Environmental Fingerprinting:** Detecting subtle artifacts left by sandbox environments that can indicate non-native execution.
- **Unconventional Detection Techniques:** Experimenting with novel methods, including leveraging system inconsistencies and behavioral triggers.
- **Practical Cybersecurity Applications:** Understanding how malware and security tools interact within controlled environments to strengthen detection capabilities.

## Disclaimer
**This script is intended for educational and research purposes only.** It should not be used for malicious activities or to bypass legitimate security measures. The author and contributors assume no responsibility for improper or unethical use. Users should comply with ethical cybersecurity standards and legal regulations.

## Usage
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/sandbox-evasion-script.git
   ```
2. Open PowerShell
3. Execute the script:
   ```sh
   .\sandbox-evasion.ps1
   ```
"I encourage everyone to experiment and explore Base64 encoding, the source code, and versions with randomly named variables!"

## Contributions
Contributions are welcome! If you have improvements or additional techniques to enhance detection capabilities, feel free to submit a pull request.

## License
This project is licensed under [MIT License](LICENSE), promoting responsible research and open collaboration.

## Contact
For inquiries, discussions, or collaboration opportunities, reach out via GitHub or email.


