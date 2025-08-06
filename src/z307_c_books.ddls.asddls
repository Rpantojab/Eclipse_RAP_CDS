@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Books_Projections'
@Metadata.allowExtensions: true
define root view entity Z307_C_BOOKS 
provider contract transactional_query
as projection on Z307_R_BOOKS
{
    key ID,
    Bookcode,
    Title,
    Description,
    Author,
    Category,
    Language,
    Publicationyear,
    Rating,
    Price,
    @Semantics.currencyCode: true
    Currency,
    Stock,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Currency
}
