module Faker
  class Address
    class << self
      def zip_code
        Faker.numerify(['#####', '#####-####'].rand)
      end
      
      def us_state
        ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'].rand
      end
      
      def us_state_abbr
        %w(AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY AE AA AP).rand
      end
      
      def city_prefix
        %w(North East West South New Lake Port).rand
      end
      
      def city_suffix
        %w(town ton land ville berg burgh borough bury view port mouth stad furt chester mouth fort haven side shire).rand
      end
      
      def city
        [
          '%s %s%s' % [city_prefix, Name.first_name, city_suffix],
          '%s %s' % [city_prefix, Name.first_name],
          '%s%s' % [Name.first_name, city_suffix],
          '%s%s' % [Name.last_name, city_suffix],
        ].rand
      end
      
      def street_suffix
        %w(Alley Avenue Branch Bridge Brook Brooks Burg Burgs Bypass Camp Canyon Cape Causeway Center Centers Circle Circles Cliff Cliffs Club Common Corner Corners Course Court Courts Cove Coves Creek Crescent Crest Crossing Crossroad Curve Dale Dam Divide Drive Drive Drives Estate Estates Expressway Extension Extensions Fall Falls Ferry Field Fields Flat Flats Ford Fords Forest Forge Forges Fork Forks Fort Freeway Garden Gardens Gateway Glen Glens Green Greens Grove Groves Harbor Harbors Haven Heights Highway Hill Hills Hollow Inlet Inlet Island Island Islands Islands Isle Isle Junction Junctions Key Keys Knoll Knolls Lake Lakes Land Landing Lane Light Lights Loaf Lock Locks Locks Lodge Lodge Loop Mall Manor Manors Meadow Meadows Mews Mill Mills Mission Mission Motorway Mount Mountain Mountain Mountains Mountains Neck Orchard Oval Overpass Park Parks Parkway Parkways Pass Passage Path Pike Pine Pines Place Plain Plains Plains Plaza Plaza Point Points Port Port Ports Ports Prairie Prairie Radial Ramp Ranch Rapid Rapids Rest Ridge Ridges River Road Road Roads Roads Route Row Rue Run Shoal Shoals Shore Shores Skyway Spring Springs Springs Spur Spurs Square Square Squares Squares Station Station Stravenue Stravenue Stream Stream Street Street Streets Summit Summit Terrace Throughway Trace Track Trafficway Trail Trail Tunnel Tunnel Turnpike Turnpike Underpass Union Unions Valley Valleys Via Viaduct View Views Village Village  Villages Ville Vista Vista Walk Walks Wall Way Ways Well Wells).rand
      end
    
      def street_name
        [ 
          Proc.new { [Name.last_name, street_suffix].join(' ') },
          Proc.new { [Name.first_name, street_suffix].join(' ') }      
        ].rand.call
      end
      
      def street_address(include_secondary = false)
        Faker.numerify([
          '##### %s' % street_name,
          '#### %s' % street_name,
          '### %s' % street_name
        ].rand + (include_secondary ? ' ' + secondary_address : ''))
      end
      
      def secondary_address
        Faker.numerify([
          'Apt. ###',
          'Suite ###'
        ].rand)
      end
      
      def country
        ["Andorra", "United Arab Emirates", "Antigua and Barbuda", "Anguilla", "Albania", "Armenia", "Netherland Antilles", "Angola", "Antarctica", "Argentina", "American Samoa", "Austria", "Australia", "Aruba", "Azerbaijan", "Bosnia-Herzegovina", "Barbados", "Bangladesh", "Belgium", "Burkina Faso", "Bulgaria", "Bahrain", "Burundi", "Benin", "Bermuda", "Brunei Darussalam", "Bolivia", "Brazil", "Bahamas", "Buthan", "Bouvet Island", "Botswana", "Belarus", "Belize", "Canada", "Cocos (Keeling) Isl.", "Central African Rep.", "Republic of the Congo", "Switzerland", "Ivory Coast", "Cook Islands", "Chile", "Cameroon", "China", "Colombia", "Costa Rica", "Democratic Republic of the Congo", "Cuba", "Cape Verde", "Christmas Island", "Cyprus", "Czech Republic", "Germany", "Djibouti", "Denmark", "Dominica", "Dominican Republic", "Algeria", "Ecuador", "Estonia", "Egypt", "Western Sahara", "Spain", "Ethiopia", "Finland", "Fiji", "Falkland Islands", "Micronesia", "Faroe Islands", "France", "French Polynesia", "Gabon", "United Kingdom (Great Britain)", "Grenada", "Georgia", "Guyana (Fr.)", "Ghana", "Gibraltar", "Greenland", "Gambia", "Guinea", "Guadeloupe (Fr.)", "Equatorial Guinea", "Greece", "Guatemala", "Guam (US)", "Guinea Bissau", "Guyana", "Hong Kong", "Heard Island and McDonald Islands", "Honduras", "Croatia", "Haiti", "Hungary", "Indonesia", "Ireland", "Israel", "India", "Iraq", "Iran", "Iceland", "Italy", "Jamaica", "Jordan", "Japan", "Kenya", "Kirgistan", "Cambodia", "Kiribati", "Comoros", "St.Kitts Nevis Anguilla", "Korea (North)", "Korea (South)", "Kuwait", "Cayman Islands", "Kazachstan", "Laos", "Lebanon", "Saint Lucia", "Liechtenstein", "Sri Lanka", "Liberia", "Lesotho", "Lithuania", "Luxembourg", "Latvia", "Libya", "Morocco", "Monaco", "Moldavia", "Madagascar", "Marshall Islands", "Mali", "Myanmar", "Mongolia", "Macau", "Northern Mariana Isl.", "Martinique (Fr.)", "Mauritania", "Montserrat", "Malta", "Mauritius", "Maldives", "Malawi", "Mexico", "Malaysia", "Mozambique", "Namibia", "New Caledonia (Fr.)", "Niger", "Norfolk Island", "Nigeria", "Nicaragua", "Netherlands", "Norway", "Nepal", "Nauru", "Niue", "New Zealand", "Oman", "Panama", "Peru", "French Southern and Antarctic Lands", "Papua New", "Philippines", "Pakistan", "Poland", "St. Pierre & Miquelon", "Pitcairn", "Puerto Rico", "Portugal", "Palau", "Paraguay", "Qatar", "Reunion (Fr.)", "Romania", "Russia", "Rwanda", "Saudi Arabia", "Solomon Islands", "Seychelles", "Sudan", "Sweden", "Singapore", "St. Helena", "Slovenia", "Svalbard & Jan Mayen Is", "Slovak Republic", "Sierra Leone", "San Marino", "Senegal", "Somalia", "Suriname", "St. Tome and Principe", "El Salvador", "Syria", "Swaziland", "Turks and Caicos Islands", "Chad", "Togo", "Thailand", "Tadjikistan", "Tokelau", "Turkmenistan", "Tunisia", "Tonga", "East Timor", "Turkey", "Trinidad & Tobago", "Tuvalu", "Taiwan", "Tanzania", "Ukraine", "Uganda", "United States Minor Outlying Islands", "United States", "Uruguay", "Uzbekistan", "Vatican City State", "St.Vincent & Grenadines", "Venezuela", "Virgin Islands (British)", "Virgin Islands (US)", "Vietnam", "Vanuatu", "Wallis & Futuna Islands", "Samoa", "Yemen", "Montenegro", "South Africa", "Zambia", "Serbia", "Zimbabwe", "Abkhazia", "Azores", "Åland Islands", "Afghanistan", "British Indian Ocean Territory", "Guernsey", "Jersey", "Kosovo", "Mayotte", "Republic of Macedonia", "Isle of Man", "Nagorno-Karabakh Republic", "Palestine", "Transnistria", "Northern Cyprus", "Republic of Somaliland", "Tamil Eelam", "Eritrea", "South Georgia and the South Sandwich Islands", "South Ossetia"].rand
      end
      
      def country_code
        ["AD", "AE", "AG", "AI", "AL", "AM", "AN", "AO", "AQ", "AR", "AS", "AT", "AU", "AW", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BM", "BN", "BO", "BR", "BS", "BT", "BV", "BW", "BY", "BZ", "CA", "CC", "CF", "CG", "CH", "CI", "CK", "CL", "CM", "CN", "CO", "CR", "CU", "CV", "CX", "CY", "CZ", "DE", "DJ", "DK", "DM", "DO", "DZ", "EC", "EE", "EG", "EH", "ES", "ET", "FI", "FJ", "FK", "FM", "FO", "FR", "PF", "GA", "GB", "GD", "GE", "GF", "GH", "GI", "GL", "GM", "GN", "GP", "GQ", "GR", "GT", "GU", "GW", "GY", "HK", "HM", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IN", "IQ", "IR", "IS", "IT", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN", "KP", "KR", "KW", "KY", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "MG", "MH", "ML", "MM", "MN", "MO", "MP", "MQ", "MR", "MS", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NC", "NE", "NF", "NG", "NI", "NL", "NO", "NP", "NR", "NU", "NZ", "OM", "PA", "PE", "TF", "PG", "PH", "PK", "PL", "PM", "PN", "PR", "PT", "PW", "PY", "QA", "RE", "RO", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SH", "SI", "SJ", "SK", "SL", "SM", "SN", "SO", "SR", "ST", "SV", "SY", "SZ", "TC", "TD", "TG", "TH", "TJ", "TK", "TM", "TN", "TO", "TP", "TR", "TT", "TV", "TW", "TZ", "UA", "UG", "UM", "US", "UY", "UZ", "VA", "VC", "VE", "VG", "VI", "VN", "VU", "WF", "WS", "YE", "ME", "ZA", "ZM", "RS", "ZW", "PT", "AX", "AF", "IO", "GG", "JE", "YT", "MK", "IM", "PS", "NC", "ER", "GS"].rand
      end
      
      # UK Variants
      def uk_county
        ['Avon', 'Bedfordshire', 'Berkshire', 'Borders', 'Buckinghamshire', 'Cambridgeshire', 'Central', 'Cheshire', 'Cleveland', 'Clwyd', 'Cornwall', 'County Antrim', 'County Armagh', 'County Down', 'County Fermanagh', 'County Londonderry', 'County Tyrone', 'Cumbria', 'Derbyshire', 'Devon', 'Dorset', 'Dumfries and Galloway', 'Durham', 'Dyfed', 'East Sussex', 'Essex', 'Fife', 'Gloucestershire', 'Grampian', 'Greater Manchester', 'Gwent', 'Gwynedd County', 'Hampshire', 'Herefordshire', 'Hertfordshire', 'Highlands and Islands', 'Humberside', 'Isle of Wight', 'Kent', 'Lancashire', 'Leicestershire', 'Lincolnshire', 'Lothian', 'Merseyside', 'Mid Glamorgan', 'Norfolk', 'North Yorkshire', 'Northamptonshire', 'Northumberland', 'Nottinghamshire', 'Oxfordshire', 'Powys', 'Rutland', 'Shropshire', 'Somerset', 'South Glamorgan', 'South Yorkshire', 'Staffordshire', 'Strathclyde', 'Suffolk', 'Surrey', 'Tayside', 'Tyne and Wear', 'Warwickshire', 'West Glamorgan', 'West Midlands', 'West Sussex', 'West Yorkshire', 'Wiltshire', 'Worcestershire'].rand
      end
      
      def uk_country
        ['England', 'Scotland', 'Wales', 'Northern Ireland'].rand
      end
      
      def uk_postcode
        Faker.bothify([
          '??# #??',
          '??## #??'
        ].rand).upcase
      end      
    end
  end
end