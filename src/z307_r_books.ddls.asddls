@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Books'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z307_R_BOOKS
  as select from z307_books_your as Books
  association [0..1] to I_CurrencyStdVH as _Currency on $projection.Currency = _Currency.Currency
{
  key id                    as ID,
      bookcode              as Bookcode,
      title                 as Title,
      description           as Description,
      author                as Author,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'Z307_I_CATEGORIES_YOURUSER',
      element: 'ID'}, useForValidation: true }]
      category              as Category,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_Language',
      element: 'Language'}, useForValidation: true  }]
      language              as Language,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CalendarYear', 
element: 'CalendarYear'}, useForValidation: true  }] 
      publicationyear       as Publicationyear,
      rating                as Rating,
      @Semantics.amount.currencyCode: 'Currency'
      price                 as Price,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH',
      element: 'Currency'}, useForValidation: true  }]
      currency              as Currency,
      stock                 as Stock,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      _Currency
}
