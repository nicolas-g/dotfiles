# used by tflint in the pre-commit

rule "terraform_deprecated_index" {
  enabled = true
}
rule "terraform_unused_declarations" {
  enabled = true
}
rule "terraform_documented_outputs" {
  enabled = true
}
rule "terraform_documented_variables" {
  enabled = true
}
rule "terraform_typed_variables" {
  enabled = true
}
rule "terraform_naming_convention" {
  enabled = true
}
rule "terraform_unused_required_providers" {
  enabled = true
}
rule "terraform_standard_module_structure" {
  enabled = true
}
