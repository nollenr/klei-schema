# klei-schema
Testing different multi-region table definitions for Klei 

Our goal is to have a global ```ku``` field that is unique across all regions.

The ```userinfo``` table should be Geo-Partitioned across all regions for fast (50-60ms) inserts and very fast reads (10s) from the same region as the partition location.  The primary key of the ```userinfo``` table would be ```(region, ku)```.


How do we guarantee uniquess of ```ku``` across all regions without having long latencies of lookups across all the regions?


One idea put forth by the prospect, was to have a Global Table (that would indeed have a very long write -- which Klei could absorb the 1st time the ```ku``` was written to the Global Table).

This Global Table would act as a parent to the ```userinfo``` table but all subsequent write FKEY checks could be against the Global Table.

Unfortunatly, we cannot mix primitives and abstractions in the same database and we don't want to split the Global and Geo-Partitioned tables into 2 different databases.

