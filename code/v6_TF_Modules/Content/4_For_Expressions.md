# Using For Expressions
- Used to create new collection based off an existing one, transforming data as needed
- Useful when we deal with resources that have count or for_each argument
- Input types
    - List, set, tuple, map or object

- Result type
    - Tuple or Object
- We can apply filtering with if statement

```
# Create a tuple

[for item in items : tuple_element]

```
- Brackets used determines result type. 
- Since in above example [] is used, it indicates tuple
- If we use {}, it creates object

- Example - We have a list(string) toppings and we want to add "Globo-" keyword to all of them, we can use for
```
locals{
    toppings = ["cheese", "lettuce", "salsa"]
}

[for t in local.toppings : "Globo-${t}"]

# Result in Tuple with output as 
["Globo-cheese","Globo-lettuce", "Globo-salsa"]
```

- Quick refresher - Object - Similar to map but it can have different data types
- If we want to create object, 

````
{for key, value in map : obj_key => obj_value}
```

- Example
```
locals {
    prices = {
        taco = "5.6"
        wrap = "9.1"
    }
}

{for i, price in local.prices : i => ceil(price)}

# Result
{taco = "6", "wrap" = "9"}

```