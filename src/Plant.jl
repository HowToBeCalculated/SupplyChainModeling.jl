"""
    Plant(name::String, location::Location; fixed_cost::Real=0.0, opening_cost::Real=0.0, closing_cost::Real=Inf, initial_opened::Bool=true, must_be_opened_at_end::Bool=false, must_be_closed_at_end::Bool=false)

Represents a plant with a name and a location.

# Fields
- `name::String`: The name of the plant. Used as a unique identifier.
- `location::Location`: The geographical location of the plant.
- `fixed_cost::Float64`: The fixed cost of operating the plant. Defaults to `0.0`.
- `opening_cost::Float64`: The cost of opening the plant. Defaults to `0.0`.
- `closing_cost::Float64`: The cost of closing the plant. Defaults to `Inf`.
- `initial_opened::Bool`: Whether the plant is initially opened. Defaults to `true`.
- `must_be_opened_at_end::Bool`: Whether the plant must be opened at the end of the planning horizon. Defaults to `false`.
- `must_be_closed_at_end::Bool`: Whether the plant must be closed at the end of the planning horizon. Defaults to `false`.
- `bill_of_material::Dict{Product, Dict{Product, Float64}}`: The bill of material for producing products.
- `unit_cost::Dict{Product, Float64}`: The unit cost for producing products. 
- `time::Dict{Product, Int}`: The production lead time for products.
- `maximum_throughput::Dict{Product, Float64}`: The maximum throughput for products.

# Constructors
- `Plant(name::String, location::Location)`: Creates a `Plant` with a specified name and location.
- `Plant(name::String, location::Location; fixed_cost::Real, opening_cost::Real, closing_cost::Real, initial_opened::Bool, must_be_opened_at_end::Bool, must_be_closed_at_end::Bool)`: Creates a `Plant` with a specified name, location, and optional parameters.

# Examples
```julia-repl
julia> plant1 = Plant("Miami", Location(25.7617, -80.1918))
julia> plant2 = Plant("Los Angeles", Location(34.0522, -118.2437), fixed_cost=1000.0)
```
"""
struct Plant <: Node
    name::String
    location::Location

    fixed_cost::Float64

    opening_cost::Float64
    closing_cost::Float64

    initial_opened::Bool
    must_be_opened_at_end::Bool
    must_be_closed_at_end::Bool

    bill_of_material::Dict{Product, Dict{Product, Float64}}
    unit_cost::Dict{Product, Float64}
    time::Dict{Product, Int}

    maximum_throughput::Dict{Product, Float64}

    function Plant(name::String, location::Location; fixed_cost::Real=0.0, opening_cost::Real=0.0, closing_cost::Real=Inf, initial_opened::Bool=true, must_be_opened_at_end::Bool=false, must_be_closed_at_end::Bool=false)
        return new(
            name,
            location,
            fixed_cost,
            opening_cost,
            closing_cost,
            initial_opened,
            must_be_opened_at_end,
            must_be_closed_at_end, 
            Dict{Product, Dict{Product, Float64}}(),  # bill_of_material
            Dict{Product, Float64}(),  # unit_cost
            Dict{Product, Int}(),  # time
            Dict{Product, Float64}()  # maximum_throughput
        )
    end
end

Base.:(==)(x::Plant, y::Plant) = x.name == y.name 
Base.hash(x::Plant, h::UInt64) = hash(x.name, h)
Base.show(io::IO, x::Plant) = print(io, x.name)

"""
    add_product!(plant::Plant, product::Product; bill_of_material::Dict{Product, Float64}, unit_cost::Float64, maximum_throughput::Real, time::Int)

Indicates that a plant can produce a product. Assumes product is not already in the plant.

# Arguments
- `plant::Plant`: The plant that can produce the product.
- `product::Product`: The product that can be produced.
- `bill_of_material::Dict{Product, Float64}`: The amount of other product needed to produce one unit of the product. This dictionary can be empty if there are no other products needed.
- `unit_cost::Float64`: The cost of producing one unit of product. Defaults to `0.0`.
- `maximum_throughput::Real`: The maximum amount of product that can be produced in a time period. Defaults to `Inf`.
- `time::Int`: The production lead time. Defaults to `0`.

"""
function add_product!(plant::Plant, product; bill_of_material::Dict{Product, Float64}, unit_cost::Float64=0.0, maximum_throughput::Real=Inf, time::Int=0)::Nothing
    plant.bill_of_material[product] = bill_of_material
    plant.unit_cost[product] = unit_cost
    plant.maximum_throughput[product] = maximum_throughput
    plant.time[product] = time
end
