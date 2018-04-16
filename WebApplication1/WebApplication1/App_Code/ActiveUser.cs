using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ActiveUser
/// </summary>
public class ActiveUser
{

   public string UserID {get; set;}
   public string FirstName { get; set; }
   public string LastName { get; set; }
   public DateTime TimeIn { get; set; }

	public ActiveUser(string userId, string firstName, string lastName, DateTime timeIn)
	{
        this.UserID = userId;
        this.FirstName = firstName;
        this.LastName = lastName;
        this.TimeIn = timeIn;
	}
}