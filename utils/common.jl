using YAML
using Printf

wd = split(pwd(), "/")
path = wd[1:end-2]
benchmark = wd[end-1]
nof = wd[end]

function get_molecules(data)

    mols = []
    for (reaction_name, reaction) in data
	set_name, system = split(reaction_name, ":")
	for info in reaction
	    if(length(info) == 2)
                mol = info[2][1:end-4]
                push!(mols, set_name*"-"*string(mol))
            end
        end
    end
    mols = unique(mols)

    return mols

end


data_5 =  YAML.load_file(join(vcat(path[1:end-1], ["Slim05", "Slim05.yaml"]), "/"))
data_16 =  YAML.load_file(join(vcat(path[1:end-1], ["Slim16", "Slim16.yaml"]), "/"))
data_20 =  YAML.load_file(join(vcat(path[1:end-1], ["Slim20", "Slim20.yaml"]), "/"))

mols_5 = get_molecules(data_5)
mols_16 = get_molecules(data_16)
mols_20 = get_molecules(data_20)

repeated = []
if benchmark == "Slim16"
    mols_16_in_5 = intersect(mols_16, mols_5)
    repeated = vcat(repeated, mols_16_in_5)
    println("Repeated with 5:")
    println(mols_16_in_5)
end

if benchmark == "Slim20"
    mols_20_in_5 = intersect(mols_20, mols_5)
    repeated = vcat(repeated, mols_20_in_5)
    println("Repeated with 5:")
    println(mols_20_in_5)

    mols_20_in_16 = intersect(mols_20, mols_16)
    repeated = vcat(repeated, mols_20_in_16)
    println("Repeated with 16:")
    println(mols_20_in_16)
end

for molecule_name in repeated
    println(string(molecule_name))
    rm(string(molecule_name)*".jl", force=true)
    rm(string(molecule_name)*".jld2", force=true)
    rm(string(molecule_name)*".fchk", force=true)
    rm(string(molecule_name)*".out", force=true)
end
