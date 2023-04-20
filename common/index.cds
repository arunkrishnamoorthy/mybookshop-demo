using { sap } from '@sap/cds/common';

extend sap.common.Currencies with {
    numcode: Integer;
    exponent: Integer;
    minor: String;
}

context sap.common.countries {

    extend sap.common.Countries {
        regions: Composition of many Regions on regions._parent = $self;
    }   

    entity Regions: sap.common.CodeList {
        key code: String(5);
        _parent: String(11);
        _children: Composition of many Regions on _children._parent = $self;
        cities: Composition of many Cities on cities.regions = $self;
    }

    entity Cities: sap.common.CodeList {
        key code: String(11);
            regions: Association to Regions;
            districts: Composition of many Districts on districts.city = $self;
    }

    entity Districts: sap.common.CodeList {
        key code: String(11);
        city: Association to Cities;
    }
}