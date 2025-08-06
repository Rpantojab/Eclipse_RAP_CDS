CLASS zcl_307_data_youruser DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES IF_OO_ADT_CLASSRUN.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_307_data_youruser IMPLEMENTATION.
METHOD if_oo_adt_classrun~main .
  DATA lt_categories TYPE TABLE OF z307_categories.
  DATA lt_books TYPE TABLE OF z307_books_your.

*Insert data table temporal
  TRY.
      lt_categories = VALUE #(
      ( id = '1624162E1BF11FD08AB52A09FD9DCE88' category = 'Programming' ) ##NO_TEXT
      ( id = '1624162E1BF11FD08AB52A09FD9DEE88' category = 'SAP CAP Development' ) ##NO_TEXT
      ( id = '1624162E1BF11FD08AB52A09FD9E0E88' category = 'Web Development' ) ##NO_TEXT
      ( id = '1624162E1BF11FD08AB52A09FD9E2E88' category = 'Artificial Intelligence' ) ##NO_TEXT
      ( id = '1624162E1BF11FD08AB52A09FD9E4E88' category = 'Cloud Computing' ) ##NO_TEXT
      ).

      lt_books = VALUE #(
      (
      id = cl_system_uuid=>create_uuid_x16_static( )
      bookCode = 'BK001'
      title = 'The TypeScript Guide'
      description = 'A comprehensive guide to TypeScript'
      author = 'John Doe'
      category = '1624162E1BF11FD08AB52A09FD9DCE88' " Programming
      language = 'E'
      publicationyear = '2022'
      rating = '0.0'
      price = '29.99'
      currency = 'USD'
      stock = 'Available'
      )
      (
      id = cl_system_uuid=>create_uuid_x16_static( )
      bookCode = 'BK002'
      title = 'Mastering CAP'
      description = 'Deep dive into SAP CAP framework'
      author = 'Jane Smith'
      category = '1624162E1BF11FD08AB52A09FD9DEE88' " SAP CAP Development
      language = 'E'
      publicationyear = '2023'
      rating = '4.8'
      price = '39.99'
      currency = 'USD'
      stock = 'LowAvailability'
      )
      (
      id = cl_system_uuid=>create_uuid_x16_static( )
      bookCode = 'BK003'

      title = 'Node.js Essentials'
      description = 'Everything about Node.js development'
      author = 'Alex Johnson'
      category = '1624162E1BF11FD08AB52A09FD9E0E88' " Web Development
      language = 'E'
      publicationyear = '2021'
      rating = '4.3'
      price = '25.5'
      currency = 'USD'
      stock = 'Available'
      )
      (
      id = cl_system_uuid=>create_uuid_x16_static( )
      bookCode = 'BK004'
      title = 'AI and Machine Learning'
      description = 'Understanding AI concepts and models'
      author = 'Emma Brown'
      category = '1624162E1BF11FD08AB52A09FD9E2E88' " Artificial Intelligence
      language = 'E'
      publicationyear = '2020'
      rating = '4.7'
      price = '49.99'
      currency = 'EUR'
      stock = 'NotAvailable'
      )

      (
      id = cl_system_uuid=>create_uuid_x16_static( )
      bookCode = 'BK005'
      title = 'Cloud Computing Basics'
      description = 'Introduction to cloud technologies'
      author = 'Michael Lee'
      category = '1624162E1BF11FD08AB52A09FD9E4E88' " Cloud Computing
      language = 'E'
      publicationyear = '2022'
      rating = '4.6'
      price = '34.99'
      currency = 'USD'
      stock = 'Available'
      )
      ).

    CATCH cx_uuid_error INTO DATA(lx_exception).
      out->write( |An exception occurred: { lx_exception->get_text( ) }|  ).
  ENDTRY.

*   delete existing entries in the database table
  DELETE FROM z307_categories.
  DELETE FROM z307_books_your.

*   insert the new table entries
  INSERT z307_categories FROM TABLE @lt_categories.
  INSERT z307_books_your FROM TABLE @lt_books.

ENDMETHOD.
ENDCLASS.
