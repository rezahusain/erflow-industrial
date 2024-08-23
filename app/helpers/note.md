# Comment:

Consider adding the US states to:

```ruby

# lib/us_states.rb
module USStates
  STATES = [
    ['Alabama', 'AL'], ['Alaska', 'AK'], ['Arizona', 'AZ'], ['Arkansas', 'AR'], ['California', 'CA'],
    ['Colorado', 'CO'], ['Connecticut', 'CT'], ['Delaware', 'DE'], ['District of Columbia', 'DC'], ['Florida', 'FL'],
    ['Georgia', 'GA'], ['Hawaii', 'HI'], ['Idaho', 'ID'], ['Illinois', 'IL'], ['Indiana', 'IN'],
    ['Iowa', 'IA'], ['Kansas', 'KS'], ['Kentucky', 'KY'], ['Louisiana', 'LA'], ['Maine', 'ME'],
    ['Maryland', 'MD'], ['Massachusetts', 'MA'], ['Michigan', 'MI'], ['Minnesota', 'MN'], ['Mississippi', 'MS'],
    ['Missouri', 'MO'], ['Montana', 'MT'], ['Nebraska', 'NE'], ['Nevada', 'NV'], ['New Hampshire', 'NH'],
    ['New Jersey', 'NJ'], ['New Mexico', 'NM'], ['New York', 'NY'], ['North Carolina', 'NC'], ['North Dakota', 'ND'],
    ['Ohio', 'OH'], ['Oklahoma', 'OK'], ['Oregon', 'OR'], ['Pennsylvania', 'PA'], ['Rhode Island', 'RI'],
    ['South Carolina', 'SC'], ['South Dakota', 'SD'], ['Tennessee', 'TN'], ['Texas', 'TX'], ['Utah', 'UT'],
    ['Vermont', 'VT'], ['Virginia', 'VA'], ['Washington', 'WA'], ['West Virginia', 'WV'], ['Wisconsin', 'WI'], ['Wyoming', 'WY']
  ].freeze

  def self.all
    STATES
  end
end

```

Then in your Application Helper:
  
```ruby
# frozen_string_literal: true

require 'us_states'

module ApplicationHelper
  def us_states
    USStates.all
  end
end
```
