public class AutosourcerApiModels {
    public enum AcquisitionChannelEnum {
        PPC, SEO_REW, SEO_CLEVER, SEO_INSIDE1031, AFFILIATE_PARTNERS, SEO_ATE, SEO_HB,
        STRATEGIC_PARTNER, FELLO, INVESTOR_COURSE, SEO_OFFERS, ENGAGEMENT_SUITE
    }

    public enum AcquisitionChannelNewEnum {
        CONTENT, PAID, PARTNERSHIPS, OTHER
    }

    public enum AcquisitionSourceEnum {
        LWC, REW, HB, EXCHANGE1031, ATE, PAID_SEARCH, PAID_SOCIALS, DIRECT_MAIL
    }

    public enum CustomerPriceRangeEnum {
        K150_OR_LESS, K150_TO_350K, K350_TO_500K, K500_TO_750K, K750_TO_1M,
        M1_OR_MORE, NOT_SURE, K500_TO_1M
    }

    public enum DealtypeEnum {
        SELL, BUY, UNKNOWN
    }

    public enum FormTypeEnum {
        MOVING_MSF, LO_PORTAL, PHONE_FORM, MORTGAGE_MSF, PARTNER_INTEGRATION, UNBOUNCE,
        CLEVER_OFFERS_AUTOHUNT, CLEVER_OFFERS_MSF, MOVING_AUTOHUNT, SELLER_AUTOHUNT,
        BUYER_AUTOHUNT, MSF
    }

    public enum HomeConditionEnum {
        MOVE_IN_READY_MODERN, MOVE_IN_READY_OLDER, NEEDS_FEW_REPAIRS, NEEDS_MAJOR_REPAIRS,
        IBUYER_NO_REPAIRS, NOT_SURE
    }

    public enum MostImportantAgentQualityForLeadEnum {
        BUYING_QUICKLY, SELLING_QUICKLY, FINDING_GREAT_DEALS, MOST_EXPERIENCE,
        NEGOTIATING_OFFERS, SAVING_ON_COMMISSION, HIGHEST_OFFER, OTHER
    }

    public enum PropertyTypeEnum {
        SINGLE_FAMILY, CONDO, MULTIFAMILY, COMMERCIAL, LAND, TOWNHOUSE, OTHER,
        COOPERATIVE, MANUFACTURED_OR_MOBILE_HOME, MIXED_USE_RESIDENTIAL, FARM,
        HOME_AND_BUSINESS_COMBINED
    }

    public enum VendorEnum {
        CLEVER, MRC, MOVEMENT_MORTGAGE, EMBRACE_HOME_LOANS, MORTGAGE_PARTNERSHIPS,
        FIRST_HOME_BANK, AMERICAN_FINANCIAL_NETWORK, RADIUS_FINANCIAL_GROUP, NEAT_LOANS,
        SUCCESS_MORTGAGE_PARTNERS, FILO_MORTGAGE, DELMAR_FINANCIAL_COMPANY, GVG, MVF,
        CUSTOMER_REFERRAL, AGENT_REFERRAL, BEELINE, SOCIETY_MORTGAGE, REVOLUTION_MORTGAGE,
        NFM_LENDING, EQ_LOANS, NATIONS_LENDING, BLUE_SPOT_HOME_LOANS, LAKE_STATE_MORTGAGE,
        LOANFLIGHT, LENDPLUS, SIERRA_PACIFIC_MORTGAGE, FIRST_MORTGAGE_DIRECT,
        AMERICAN_FEDERAL_MORTGAGE, BISON_BANK, INTEREST, MCGLONE_MORTGAGE, HOMESTEAD,
        LAKE_MICHIGAN_CREDIT_UNION, TOTAL_EXPERT, MR_COOPER, MOUNTAIN_WEST_FINANCIAL,
        TOTAL_MORTGAGE, DK_MORTGAGE, BANK_OF_ENGLAND, NORTHPOINTE, RWM_HOME_LOANS,
        AMFED, MARLIN_MORTGAGE, ANNIE_MAC, REVIVAL_LENDING, BIGGER_POCKETS,
        FOUNTAIN_MORTGAGE, JVM_LENDING, OWNERLY, BNC_NATIONAL_BANK, LOANLOCK,
        MIG_ONLINE, RAPID_TRAC, SECURE_CHOICE, LADERA_LENDING, WATERSTONE_MORTGAGE,
        NMB, HOMESCOUT, GRIFFIN_FUNDING, UNREAL_ESTATE, FELLOWSHIP,
        VALLEY_VIEW_HOME_LOANS, PRMG, US_MORTGAGE, IBUYER_COM, NEXA_MORTGAGE,
        CROSS_COUNTRY_MORTGAGE, NEWFI, LENDINGTREE, WATSON_MORTGAGE_CORP,
        FIRST_FEDERAL_BANK_MORTGAGE_LENDER, RABBU, ARMED_FORCES_BANK, GO_MORTGAGE,
        BANKRATE, VALON_MORTGAGE, NOVUS_HOME_MORTGAGE, FIRST_COMMUNITY_MORTGAGE,
        ROYAL_UNITED_MORTGAGE, GRAVY, WINGS_CREDIT_UNION,
        CROSS_COUNTRY_MORTGAGE_FAIRFIELD_BRANCH, FARMERS_BANK, FOUNDATION_HOME_LOANS,
        MOVINGFUL
    }

    public class LeadsApiDeal {
        public DealtypeEnum dealtype;
        public CustomerPriceRangeEnum customer_price_range;
        public String deduplication_id;
        public HomeConditionEnum home_condition;
        public MostImportantAgentQualityForLeadEnum most_important_agent_quality_for_lead;
        public PropertyTypeEnum property_type;
        public String buyer_commission_model_id;
        public String time_frame;
        public String location;
        public LeadsApiCustomer customer;
        public LeadsApiLoanOfficer loan_officer;
        public LeadSource lead_source_data;
    }

    public class LeadsApiCustomer {
        public String email;
        public String firstname;
        public String lastname;
        public Boolean is_call_eligible;
        public String phone;
        public Boolean text_consent_opt_in;
    }

    public class LeadsApiLoanOfficer {
        public String email;
        public String firstname;
        public String lastname;
        public String company_name;
        public String phone;
    }

    public class LeadSource {
        public String conversion_page;
        public String conversion_session_landing_page;
        public FormTypeEnum form_type;
        public String ga_client_id;
        public AcquisitionChannelEnum acquisition_channel;
        public AcquisitionChannelNewEnum acquisition_channel_new;
        public AcquisitionSourceEnum acquisition_source;
        public String submit_url;
        public String adgroup;
        public String adposition;
        public String creative;
        public String device;
        public String devicemodel;
        public String gclid;
        public Boolean is_homebay;
        public Boolean is_real_estate_witch;
        public String matchtype;
        public String msclkid;
        public String network;
        public String placement;
        public String segment;
        public String utm_ad;
        public String utm_adgroup;
        public String utm_campaign;
        public String utm_keyword;
        public String utm_medium;
        public String utm_source;
        public VendorEnum vendor;
        public String google;
        public String is_anytime_estimate;
        public String deal;
        public Datetime created_at;
        public Datetime updated_at;
    }
}
