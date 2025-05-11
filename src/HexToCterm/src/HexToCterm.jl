module HexToCterm

using Colors
using FixedPointNumbers
import TOML

const hexf   = "../../lua/halender/colors/hex.lua"
const ctermf = "../../lua/halender/colors/cterm.lua"

@assert isfile(hexf)
@assert isfile(ctermf)

const HexRGB = RGB{N0f8}

const ansi_strs::Dict{String, String} = TOML.parsefile("ansi_rgb.toml")

const ansi::Dict{String,HexRGB} =
  Dict(k => parse(HexRGB, v)
         for (k, v) ∈ (pairs ∘ TOML.parsefile)("ansi_rgb.toml"))

const theme::Dict{String,HexRGB} =
  (function()
    d = Dict{String,HexRGB}()
    started = false

    for l ∈ readlines(hexf)
      occursin(r"^ *-- HexToCterm: END$", l) && return d
      if !started
        occursin(r"^ *-- HexToCterm: START$", l) && (started = true)
        continue
      end

      m = match(r"^ +(?<name>\S+) += \"#(?<hex>[A-Za-z0-9]{3,8})\",", l)
      m === nothing && continue
      d[m[:name]] = parse(HexRGB, "#" * m[:hex])
    end
  end)()

_find_closest(name::AbstractString)::String =
  reduce((x, y) -> colordiff(theme[name], ansi[x]) ≤
                   colordiff(theme[name], ansi[y]) ? x : y,
               keys(ansi))

function convert()
  started = false
  doc = ""

  for l ∈ readlines(ctermf; keep=true)
    occursin(r"^ *-- HexToCterm: END$", l) && (started = false)
    if !started
      occursin(r"^ *-- HexToCterm: START$", l) && (started = true)
      doc *= l
      continue
    end

    m = match(r"^(?<head> +)(?<name>\S+) += (\d{1,3}|\"\S{7}\"),.*$", l)
    if m === nothing
      doc *= l
      continue
    end

    cid = _find_closest(m[:name])
    doc *= m[:head] * m[:name] * " = " * cid *
             ", -- #" * ansi_strs[cid] * "\n"
  end

  open(ctermf, "w") do f
    write(f, doc)
  end
end

end # module HexToCterm
