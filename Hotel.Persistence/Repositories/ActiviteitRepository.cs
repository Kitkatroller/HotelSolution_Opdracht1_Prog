using Hotel.Domain.Exceptions;
using Hotel.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Persistence.Repositories
{
    public class ActiviteitRepository : IActiviteitRepository
    {
        private string connectionString;

        public ActiviteitRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public Activiteit GetActiviteit(int id)
        {
            Activiteit activiteit = null;

            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string activiteitSql = @"
    SELECT * FROM Activiteit WHERE Id = @id";

                    using (var activiteitCmd = new SqlCommand(activiteitSql, conn))
                    {
                        activiteitCmd.Parameters.AddWithValue("@id", id);

                        using (var activiteitReader = activiteitCmd.ExecuteReader())
                        {
                            if (activiteitReader.Read())
                            {
                                activiteit = new Activiteit(
                                    activiteitReader.GetInt32(activiteitReader.GetOrdinal("Id")),
                                    activiteitReader.GetString(activiteitReader.GetOrdinal("Description")),
                                    activiteitReader.GetString(activiteitReader.GetOrdinal("Location")),
                                    (TimeSpan)activiteitReader["Duration"],
                                    activiteitReader.GetString(activiteitReader.GetOrdinal("Name")),
                                    activiteitReader.GetDateTime(activiteitReader.GetOrdinal("Date")),
                                    activiteitReader.GetInt32(activiteitReader.GetOrdinal("AvailablePlaces")),
                                    (float)activiteitReader.GetDouble(activiteitReader.GetOrdinal("AdultPrice")),
                                    (float)activiteitReader.GetDouble(activiteitReader.GetOrdinal("ChildPrice")),
                                    (float)activiteitReader.GetDouble(activiteitReader.GetOrdinal("Discount")),
                                    activiteitReader.GetInt32(activiteitReader.GetOrdinal("OrganisatorId"))
                                );
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving activiteit", ex);
            }

            return activiteit;
        }

        public void AddActiviteit(Activiteit activiteit)
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string insertSql = @"
INSERT INTO Activiteit (Description, Location, Duration, Name, Date, AvailablePlaces, AdultPrice, ChildPrice, Discount, OrganisatorId)
VALUES (@Description, @Location, @Duration, @Name, @Date, @AvailablePlaces, @AdultPrice, @ChildPrice, @Discount, @OrganisatorId)";

                    using (var cmd = new SqlCommand(insertSql, conn))
                    {
                        cmd.Parameters.AddWithValue("@Description", activiteit.Description);
                        cmd.Parameters.AddWithValue("@Location", activiteit.Location);
                        cmd.Parameters.AddWithValue("@Duration", activiteit.Duration);
                        cmd.Parameters.AddWithValue("@Name", activiteit.Name);
                        cmd.Parameters.AddWithValue("@Date", activiteit.Date);
                        cmd.Parameters.AddWithValue("@AvailablePlaces", activiteit.AvailablePlaces);
                        cmd.Parameters.AddWithValue("@AdultPrice", activiteit.AdultPrice);
                        cmd.Parameters.AddWithValue("@ChildPrice", activiteit.ChildPrice);
                        cmd.Parameters.AddWithValue("@Discount", activiteit.Discount);
                        cmd.Parameters.AddWithValue("@OrganisatorId", activiteit.OrganisatorId);

                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error adding activiteit", ex);
            }
        }

        public void UpdateActiviteit(Activiteit activiteit)
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string updateSql = @"
UPDATE Activiteit 
SET Description = @Description, 
    Location = @Location, 
    Duration = @Duration, 
    Name = @Name, 
    Date = @Date, 
    AvailablePlaces = @AvailablePlaces, 
    AdultPrice = @AdultPrice, 
    ChildPrice = @ChildPrice, 
    Discount = @Discount, 
    OrganisatorId = @OrganisatorId
WHERE Id = @Id";

                    using (var cmd = new SqlCommand(updateSql, conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", activiteit.Id);
                        cmd.Parameters.AddWithValue("@Description", activiteit.Description);
                        cmd.Parameters.AddWithValue("@Location", activiteit.Location);
                        cmd.Parameters.AddWithValue("@Duration", activiteit.Duration);
                        cmd.Parameters.AddWithValue("@Name", activiteit.Name);
                        cmd.Parameters.AddWithValue("@Date", activiteit.Date);
                        cmd.Parameters.AddWithValue("@AvailablePlaces", activiteit.AvailablePlaces);
                        cmd.Parameters.AddWithValue("@AdultPrice", activiteit.AdultPrice);
                        cmd.Parameters.AddWithValue("@ChildPrice", activiteit.ChildPrice);
                        cmd.Parameters.AddWithValue("@Discount", activiteit.Discount);
                        cmd.Parameters.AddWithValue("@OrganisatorId", activiteit.OrganisatorId);

                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error updating activiteit", ex);
            }
        }

        public List<Activiteit> GetAllActiviteiten()
        {
            List<Activiteit> activiteiten = new List<Activiteit>();

            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "SELECT * FROM Activiteit";

                    using (var cmd = new SqlCommand(query, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Activiteit activiteit = new Activiteit(
                                    reader.GetInt32(reader.GetOrdinal("Id")),
                                    reader.GetString(reader.GetOrdinal("Description")),
                                    reader.GetString(reader.GetOrdinal("Location")),
                                    (TimeSpan)reader["Duration"],
                                    reader.GetString(reader.GetOrdinal("Name")),
                                    reader.GetDateTime(reader.GetOrdinal("Date")),
                                    reader.GetInt32(reader.GetOrdinal("AvailablePlaces")),
                                    (float)reader.GetDouble(reader.GetOrdinal("AdultPrice")),
                                    (float)reader.GetDouble(reader.GetOrdinal("ChildPrice")),
                                    (float)reader.GetDouble(reader.GetOrdinal("Discount")),
                                    reader.GetInt32(reader.GetOrdinal("OrganisatorId"))
                                );
                                activiteiten.Add(activiteit);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving all activiteiten", ex);
            }

            return activiteiten;
        }

    }
}
