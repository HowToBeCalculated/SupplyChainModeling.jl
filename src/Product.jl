"""
    Product(name::String, zones::Array{Float64, 1}=[1.0])

Represents a product with a name and an array of zones.

# Fields
- `name::String`: The name of the product. Used as a unique identifier.
- `zones::Array{Float64, 1}`: The zones in which the product can be sold. Defaults to `[1.0]`.

# Constructors
- `Product(name::String, zones::Array{Float64, 1})`: Creates a `Product` with a specified name and zones.

# Examples
```julia-repl
julia> product1 = Product("A", [1.0, 2.0, 3.0])  # With zones
julia> product2 = Product("B")  # Without zones (defaults to [1.0])
```
"""
struct Product
    name::String
    zones::Array{Float64, 1}

    function Product(name:: String, zones::Array{Float64, 1}=[1.0])
        return new(name, zones)
    end
end

Base.:(==)(x::Product, y::Product) = x.name == y.name 
Base.hash(x::Product, h::UInt64) = hash(x.name, h)
Base.show(io::IO, x::Product) = print(io, x.name)
