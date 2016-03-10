
def shares_data(overrides={})
{
    name: "Nestle",
    current_price: 5304,
    year_low: 4990,
    year_high: 7499,
    current_PE_ratio: 90.80,
    market_cap: 51143.23,
    book_value: 352.69,
    description: "Nestle is in the Food Processing sector. The current market capitalisation stands at Rs 51,143.23 crore.",
    price_to_book_value: 15.40

}.merge(overrides)
end