## Navigate to the Zillow database
    use zillow;

## Find a house with 4 bedrooms 3 bathrooms and over 3000 finished square feet12 in 2016

    select *
    from properties_2016
    where bedroomcnt = 4 and
    bathroomcnt = 3
    and finishedsquarefeet12 > 3000;
        # 29,491 homes

## Find a home with an air-conditioner, in the region zip code 96339 in 2016
    select *
    from properties_2016
    where airconditioningtypeid > 0
    and regionidzip = 96339;
        # 5995 houses

## Show homes with over 15 bedrooms and over 10 bathrooms with a tax amount over 15 thousand dollars in 2016

    select *
    from properties_2016
    where bedroomcnt > 15
    and bathroomcnt > 10
    and taxamount > 15000.00;
        # 12 houses

## Find a homes built between 1990 and 1996 and assessed again in 2015 in 2016

    select *
    from properties_2016
    where yearbuilt between 1990 and 1996
    and assessmentyear = 2015;
        #146780 houses

## Find homes with latitude between 34729300 and 34741500 has 3 or more rooms with at least 1 bathroom in 2016

    select *
    from properties_2016
    where latitude between 34729300 and 34741500
    and bedroomcnt >= 3
    and bathroomcnt >= 1;
        #144 homes

## Find homes where the air-conditioning, basement square feet, and fireplace, are not listed, but the garage car count is. in 2016 limit to the first 50.

    select *
    from properties_2016
    where airconditioningtypeid is NULL
    and basementsqft is NULL
    and fireplacecnt is NULL
    and garagecarcnt >= 1
    limit 50;

## Show homes with over 7 air-conditioners, at least 3 bathrooms, and 4 bedrooms. in 2016

    select *
    from properties_2016
    where airconditioningtypeid > 7
    and bathroomcnt >= 3
    and bedroomcnt >= 4;
        # 15668 houses.