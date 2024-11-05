
"""
    Location(latitude::Float64, longitude::Float64, name::Union{Missing, Location})

Represents a geographical location with a latitude and longitude, and an optional name.

# Fields
- `latitude::Float64`: The latitude of the location.
- `longitude::Float64`: The longitude of the location.
- `name::Union{Missing, Location}`: The name of the location. If unspecified, it defaults to `missing`.

# Constructors
- `Location(latitude::Float64, longitude::Float64)`: Creates a `Location` with a specified latitude and longitude.
- `Location(latitude::Float64, longitude::Float64, name::Location)`: Creates a `Location` with a specified latitude, longitude, and name.

# Examples
```julia-repl
julia> location1 = Location(40.7128, -74.0060)
julia> location2 = Location(40.7128, -74.0060, "New York")
```
"""
struct Location
    latitude::Float64
    longitude::Float64
    name::Union{Missing, Location}

    function Location(latitude::Float64, longitude::Float64, name::Union{Nothing, Location}=nothing)
        return new(latitude, longitude, name)
    end
end
