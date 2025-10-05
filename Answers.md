# Answers to Part 3

Add your answers to the questions in Part 3, Step 2 below. 

## Vulernability Remediation:
### Vulnerability 1: 
1. Which package or library are you addressing?
Pillow version 10.1.0 PIL.ImageMath.eval arbitrary code execution.

3. Which CVE is linked to this vulnerability?
CVE-2023-50447 this vulnerability is caused by PIL.ImageMath.eval function where characters are not sanitized properly(specifically double underscore), which can lead to code execution.

5. What remediation steps do you suggest?
This vulnerability has been fixed with verion 10.2.0. Simply updating the package version will solve this issue. If updating is not possible, improve character validation can remediate this vulnerability.

### Vulnerability 2:
1. Which vulnerability are you addressing?
PyYAML 5.1 through 5.1.2 insufficient restrictions on untrusted YAML files through full_load method causing remote code execution.

3. Which CVE is linked to this vulnerability?
CVE-2019-20477, this is another code execution vulnerability, but through different method.

5. What remediation steps do you suggest?
Since the library allows untrusted YAML through load functions, use yaml.safe_load or SafeLoader can remediate this vulnerability.
