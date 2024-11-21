[CmdletBinding()]
param ()

$ErrorActionPreference = 'stop'

$root = $PSScriptRoot

$SimpleShemaFile = Join-Path -Path $root -ChildPath "DiscriminatorProblemSampleSimple.yaml" -Resolve
$ComplexShemaFile = Join-Path -Path $root -ChildPath "DiscriminatorProblemSampleComplex.yaml" -Resolve

# <CLI|CSharp|Go|Java|PHP|Python|Ruby|Swift|TypeScript>

$LanguagesToGenerate = @(
    "CSharp"
    # "Go"
    # "Java"
    # "PHP"
    # "Python"
    # "Ruby"
    # "Swift"
    # "TypeScript"
)

foreach ($lang in $LanguagesToGenerate) {
    & kiota generate -d $SimpleShemaFile -l $lang -o ./Generated/Simple/$lang --clean-output
    & kiota generate -d $ComplexShemaFile -l $lang -o ./Generated/Complex/$lang --clean-output
}
