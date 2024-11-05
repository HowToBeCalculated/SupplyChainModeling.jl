"""
    Demand(customer::Customer, product::Product, demand::Array{R, 1}; sales_price::Float64=0.0, lost_sales_cost::Float64=0.0, service_level::Float64=1.0) where R <: Real

Represents the demand for a product from a customer.

# Fields
- `customer::Customer`: The customer who demands the product.
- `product::Product`: The product demanded by the customer.
- `demand::Array{R, 1}`: The demand for the product. The length of the array corresponds to the number of periods in the planning horizon.
- `sales_price::Float64`: The revenue of a sale. Defaults to `0.0`.
- `lost_sales_cost::Float64`: The total cost of a lost sales; including loss of overall business. Defaults to `0.0`.
- `service_level::Float64`: The desired service level. Defaults to `1.0`.

# Constructors
- `Demand(customer::Customer, product::Product, demand::Array{R, 1}; sales_price::Float64, lost_sales_cost::Float64, service_level::Float64) where R <: Real`: Creates a `Demand` with a specified customer, product, demand, and optional parameters.

# Examples
```julia-repl
julia> demand1 = Demand(customer1, product1, [100.0, 200.0, 300.0], sales_price=10.0, lost_sales_cost=100.0, service_level=0.95)
julia> demand2 = Demand(customer2, product2, [50.0, 100.0, 150.0])
```
"""
struct Demand
    customer::Customer
    product::Product
    demand::Array{R, 1} where R <: Real

    sales_price::Float64
    lost_sales_cost::Float64
    service_level::Float64

    function Demand(customer::Customer, product::Product, demand::Array{R, 1}; sales_price::Float64=0.0, lost_sales_cost::Float64=0.0, service_level::Float64=1.0) where R <: Real
        return new(customer, product, demand, sales_price, lost_sales_cost, service_level)
    end
end
