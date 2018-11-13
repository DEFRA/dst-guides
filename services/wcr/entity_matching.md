# Entity matching

All registrations, whether new or renewing are matched against existing entities. This entity information comes from internal systems and is a list of company and person convictions from the last 12 months.

We check each registration for a match, and if found the registration will be marked as pending till such time as the match has been reviewed.

## Company matching

Assume our entity data contained the following records and we are searching for company name *test waste services* and company number *01649776*

```csv
Test Waste Services Ltd.,,12345678,PQR,7766
Recycle-pro (UK) Limited,,00009876,RST,
```

If company number is present as a parameter the service will first search for an exact match for it. The first result that matches is returned.

If there is no match then it will try searching by company number again, but this time will remove any leading zeros from the reference provided. The first result that matches is returned.

If that fails it will then do a search by the company name. First all none alphanumeric characters are replaced with spaces. It then splits what remains into an array of words and checks each against a bank of general words it will ignore e.g. 'ltd', 'plc', 'and' etc. If there is a match it will ignore the word, if not it will put the word forward for searching.

Assuming we haven't removed all possible terms in this process, it will then query the database with what remains. For each result returned it will loop through looking for a result which contains all our search terms. Only if it finds one will it return a match.

## Person matching

Assume our entity data contained the following records and we are searching for first name *Jane*, last name *Blogs*

```csv
"Blogs, Fred",01/02/1980,,ABC,1234
"Blogs, Jane",02/02/1981,,BCDEF,2345
```

The service will first search for any entity with the same date of birth, and a name that includes both the first and last name of the person. So all these would match for example

- "Blogs, Jane"
- "Blogs, Janey"
- "Jane Blogs"
- "Blogsy, Jane"

The first result that matches is returned.

If that fails we then do a the same search only without the date. The first result that matches is returned.
