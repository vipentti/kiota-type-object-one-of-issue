[CmdletBinding()]
param ()

$ErrorActionPreference = 'stop'

$root = $PSScriptRoot

$SimpleShemaFile = Join-Path -Path $root -ChildPath "DiscriminatorProblemSampleSimple.yaml" -Resolve
$ComplexShemaFile = Join-Path -Path $root -ChildPath "DiscriminatorProblemSampleComplex.yaml" -Resolve
$HierarchyShemaFile = Join-Path -Path $root -ChildPath "DiscriminatorProblemSampleHierarchy.yaml" -Resolve

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
    & dotnet tool run kiota generate -d $SimpleShemaFile -l $lang -o ./Generated/Simple/$lang --clean-output
    & dotnet tool run kiota generate -d $ComplexShemaFile -l $lang -o ./Generated/Complex/$lang --clean-output
    & dotnet tool run kiota generate -d $HierarchyShemaFile -l $lang -o ./Generated/Hierarchy/$lang --clean-output
}
