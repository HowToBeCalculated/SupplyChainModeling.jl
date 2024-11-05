"""
    VehicleType(name::String, count::Int64; fixed_cost::Float64=0.0, maximum_capacity::Array{Float64, 1}=[Inf], maximum_time::Float64=Inf)

Represents a type of vehicle.

# Fields
- `name::String`: The name of the vehicle type.
- `count::Int64`: The number of vehicles of this type.
- `fixed_cost::Float64`: The fixed cost of using a vehicle of this type. Defaults to `0.0`.
- `maximum_capacity::Array{Float64, 1}`: The maximum capacity of the vehicle. Defaults to `[Inf]`.
- `maximum_time::Float64`: The maximum time a vehicle of this type can be used. Defaults to `Inf`.

# Constructors
- `VehicleType(name::String, count::Int64; fixed_cost::Float64, maximum_capacity::Array{Float64, 1}, maximum_time::Float64)`: Creates a `VehicleType` with a specified name, count, and optional parameters.

# Examples
```julia-repl
julia> vehicle_type1 = VehicleType("Truck", 10)
julia> vehicle_type2 = VehicleType("Van", 5, fixed_cost=1000.0, maximum_capacity=[100.0, 200.0], maximum_time=8.0)
```
"""

struct VehicleType
    name::String
    count::Int64

    fixed_cost::Float64
    maximum_capacity::Array{Float64, 1}
    maximum_time::Float64

    function VehicleType(name::String, count::Int64; fixed_cost::Float64=0.0, maximum_capacity::Array{Float64, 1}=[Inf], maximum_time::Float64=Inf)
        return new(name, count, fixed_cost, maximum_capacity, maximum_time)
    end
end