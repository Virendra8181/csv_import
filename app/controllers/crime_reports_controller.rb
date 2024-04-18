class CrimeReportsController < ApplicationController

   def import_data 
       data = Roo::Spreadsheet.open(params[:xlsx_path])
       header = ["state", "state_code", "city_name", "identification_code"] + (1990..2019).to_a.map(&:to_i)
       (2..data.last_row).each do |i|
           row = Hash[[header, data.row(i)].transpose]
           state_info = {
              "state" => row["state"],
              "state_code" => row["state_code"]
           }
           city_info={
              "city_name"=>row["city_name"],
              "identification_code"=>row["identification_code"],
              "state_code"=>row["state_code"]
           }
           crime_report = {
                "1990" => row[1990],"1991" => row[1991],"1992" => row[1992],"1993" => row[1993],
                "1994" => row[1994],"1995" => row[1995],"1996" => row[1996],"1997" => row[1997],"1998" => row[1998],"1999" => row[1999],"2000" => row[2000],"2001" => row[2001],
                "2002" => row[2002],"2003" => row[2003],"2004" => row[2004],"2005" => row[2005],
                "2006" => row[2006],"2007" => row[2007],"2008" => row[2008],"2009" => row[2009],
                "2010" => row[2010],"2011" => row[2011],"2012" => row[2012],"2013" => row[2013],"2014" => row[2014],"2015" => row[2015],"2016" => row[2016],"2017" => row[2017],
                "2018" => row[2018],"2019" => row[2019]
           }

           State.create(state_info) unless State.find_by(state_code: row["state_code"]).present?
           @city=City.find_by(identification_code: row["identification_code"])
            unless @city.present?
            @city = City.create(city_info)
            end 
           crime_report.each do|key,val|
                 crime_report_values={
                   "year"=>key,
                   "crime_report"=>val,
                   "city_id"=>@city.id,
                 }
                 CrimeReport.create(crime_report_values) unless CrimeReport.find_by(city_id:@city.id,year:key).present?
            end 
            
           
        end 

     end


     def crime_report_values
      @city =City.find_by_city_name(params[:city])
      if @city.present?
         crime_reports = @city.crime_reports.pluck(:crime_report)
         year = @city.crime_reports.pluck(:year)
         render json: { success: true, crime_reports: crime_reports,years: year}
       else
         render json: { success: false, error: "City not found" }
       end
     end       
end