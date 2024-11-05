"""
    Supplier(name::String, location::Union{Location, Missing}=missing)

Represents a supplier with a name and an optional location.

# Fields
- `name::String`: The name of the supplier. Used as a unique identifier.
- `location::Union{Location, Missing}`: The geographical location of the supplier. If unspecified, it defaults to `missing`.
- `unit_cost::Dict{Product, Float64}`: The cost per unit of the product from this supplier.
- `maximum_throughput::Dict{Product, Float64}`: The maximum number of units that can be provided in each time period.

# Constructors
- `Supplier(name::String, location::Union{Location, Missing})`: Creates a `Supplier` with a specified name and location.
- `Supplier(name::String)`: Creates a `Supplier` with a specified name and a `missing` location.

# Examples
```julia-repl
julia> supplier1 = Supplier("Acme", Location(40.7128, -74.0060))
julia> supplier2 = Supplier("Bobs")
```
"""
struct Supplier <: Node
    name::String
    location::Union{Location, Missing}

    unit_cost::Dict{Product, Float64}
    maximum_throughput::Dict{Product, Float64}

    function Supplier(name::String, location::Union{Location, Missing}=missing)
        return new(name, location, Dict{Product, Float64}(), Dict{Product, Float64}())
    end
end

Base.:(==)(x::Supplier, y::Supplier) = x.name == y.name 
Base.hash(x::Supplier, h::UInt64) = hash(x.name, h)
Base.show(io::IO, x::Supplier) = print(io, x.name)

"""
    add_product!(supplier::Supplier, product::Product; unit_cost::Real, maximum_throughput::Real=Inf)

Indicates that a supplier can provide a product.

# Arguments
- `supplier::Supplier`: The supplier that can provide the product.
- `product::Product`: The product that the supplier can provide.
- `unit_cost::Real`: The cost per unit of the product from this supplier.
- `maximum_throughput::Real`: The maximum number of units that can be provided in each time period. Defaults to `Inf`.
"""
function add_product!(supplier::Supplier, product::Product; unit_cost::Real, maximum_throughput::Real=Inf)
    supplier.unit_cost[product] = unit_cost
    supplier.maximum_throughput[product] = maximum_throughput
end