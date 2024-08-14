dotnet new sln --name webapi
dotnet new webapi
dotnet new console --name Bar --output Bar
dotnet sln add Github-TopTech-Backend-Test.csproj
dotnet sln add .\Bar\Bar.csproj
dotnet restore
dotnet build FooBar.sln



dotnet publish webapi.sln -c Release -o out


docker build -t weatherapi:1.0 .


docker run -d -p 8000:8000 --name weatherapi weatherapi:1.1

docker run -d -p 8000:8000 --name weatherapi weatherapi:1.0

หยุดคอนเทนเนอร์เดิม:
docker stop weatherapi


-- ใช้คำสั่ง docker run เพื่อหยุดและลบคอนเทนเนอร์เก่าพร้อมกับรันคอนเทนเนอร์ใหม่:
docker run --rm -d -p 8000:8000 --name weatherapi weatherapi:1.0
