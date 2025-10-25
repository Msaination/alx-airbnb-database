# Database Normalization Review and Adjustments

## Initial Schema Review

The initial schema represents the core entities of a property booking system with related attributes:

- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

The schema mostly respects normalization principles but can be analyzed further for potential redundancies or anomalies.

***

## Normalization Analysis and Potential Issues

### 1. First Normal Form (1NF)
- All tables have atomic values in each column.
- No repeating groups or arrays.

### 2. Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on the whole primary key.
- Since each table uses a single UUID as primary key, no partial dependency issues exist.

### 3. Third Normal Form (3NF)
- No transitive dependencies: non-key attributes are not dependent on other non-key attributes.

***

### Specific Checks:

- **User Table**

  No redundant or calculated data; all attributes directly relate to the user.

- **Property Table**

  - `host_id` references `User`, correctly normalized.
  - Attributes fully describe the property.
  - No non-key attribute depends on another non-key attribute.

- **Booking Table**

  - `total_price` can be considered dependent on `start_date`, `end_date`, and `pricepernight` of the property.
  - This could introduce redundancy since price can be computed.
  
  **Suggestion:** Remove `total_price` and calculate dynamically to maintain strict 3NF.

- **Payment Table**

  - Properly references Booking.
  - All attributes depend only on payment_id.

- **Review Table**

  - `rating` and `comment` relate directly to the review entity.
  - No redundancy.

- **Message Table**

  - Proper references.
  - No issue detected.

***

## Adjusted Schema Recommendations to Achieve 3NF

| Table    | Attribute      | Adjustment                                      | Reason                                 |
|----------|----------------|------------------------------------------------|----------------------------------------|
| Booking  | total_price    | Remove `total_price` from the table             | Derived attribute; can cause redundancy |
| Booking  | -              | Calculate total_price on querying: `pricepernight * (end_date - start_date)` | Keeps data consistent and reduces update anomalies |

***

## Summary

- All tables conform to 1NF and 2NF.
- `total_price` in Booking violates 3NF by storing derived data.
- Removing `total_price` from the Booking table resolves redundancy.
- Calculating `total_price` dynamically ensures data integrity and normalization compliance.

***

Would you like me to generate the updated schema reflecting these changes?
