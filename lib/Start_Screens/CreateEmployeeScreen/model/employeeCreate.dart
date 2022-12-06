class EmployeeData{
      String FirstName,
             MiddleName,
             LastName,
             Preferred_Name,
             Gender,
             email,
             doj;
      EmployeeData(
      this.FirstName,
      this.MiddleName,
      this.LastName,
      this.Preferred_Name,
      this.Gender,
      this.email,
      this.doj
          );

      Map<String, dynamic> toJson() =>
          {
            'first_name' : FirstName,
            'middle_name': MiddleName,
            'last_name' : LastName,
            'preferred_name' : Preferred_Name,
            'gender' : Gender,
            'email' : email,
            'date_of_joining' : doj
          };


}