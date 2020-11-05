class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Rapper' },
    { id: 3, name: 'DJ' },
    { id: 4, name: 'Graffiti artist' },
    { id: 5, name: 'Track maker' },
    { id: 6, name: 'Dancer' },
    { id: 7, name: 'Producer' },
    { id: 8, name: 'Other' }
  ]
end