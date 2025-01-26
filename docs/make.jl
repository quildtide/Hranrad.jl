using Hranrad
using Documenter

DocMeta.setdocmeta!(Hranrad, :DocTestSetup, :(using Hranrad); recursive = true)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers
const numbered_pages = [
    file for file in readdir(joinpath(@__DIR__, "src")) if
    file != "index.md" && splitext(file)[2] == ".md"
]

makedocs(;
    modules = [Hranrad],
    authors = "quildtide@gmail.com",
    repo = "https://github.com/quildtide/Hranrad.jl/blob/{commit}{path}#{line}",
    sitename = "Hranrad.jl",
    format = Documenter.HTML(; canonical = "https://quildtide.github.io/Hranrad.jl"),
    pages = ["index.md"; numbered_pages],
)

deploydocs(; repo = "github.com/quildtide/Hranrad.jl")
