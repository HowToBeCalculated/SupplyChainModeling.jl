"""
    Customer(name::String, location::Union{Missing, Location}=missing)

Represents a customer with a name and an optional location.

# Fields
- `name::String`: The name of the customer. Used as a unique identifier.
- `location::Union{Missing, Location}`: The geographical location of the customer. If unspecified, it defaults to `missing`.

# Constructors
- `Customer(name::String, location::Location)`: Creates a `Customer` with a specified name and location.
- `Customer(name::String)`: Creates a `Customer` with a specified name and a `missing` location.

# Examples
```julia-repl
julia> customer1 = Customer("Alice", Location(40.7128, -74.0060))
julia> customer2 = Customer("Bob")
```
"""
struct Customer <: Node
    name::String
    location::Union{Missing, Location}

    function Customer(name::String, location::Union{Missing, Location}=missing)
        return new(name, location)
    end
end

Base.:(==)(x::Customer, y::Customer) = x.name == y.name 
Base.hash(x::Customer, h::UInt64) = hash(x.name, h)
Base.show(io::IO, x::Customer) = print(io, x.name)