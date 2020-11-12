class DaysToShip < ActiveHash::Base
  self.data = [
    {id: 1 , name: "--" },
    {id: 2 , name: "1~2日" },
    {id: 3 , name: "3~4日" },
    {id: 4 , name: "5~8日" },
    {id: 5 , name: "9~20日" }
  ]
  
end