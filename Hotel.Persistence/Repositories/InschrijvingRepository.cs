using Hotel.Domain.Interfaces;
using Hotel.Domain.Model;
using Hotel.Persistence.Exceptions;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Persistence.Repositories
{
    public class InschrijvingRepository : IInschrijvingRepository
    {
        private string connectionString;

        public InschrijvingRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public int AantalAllIngeschreven(int activiteitenId)
        {
            return 1;
        }

        public void SchrijfNieuweMembersIn(List<Member> membersToParticipate, float cost)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlTransaction sqlTransaction = conn.BeginTransaction())
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        cmd.Transaction = sqlTransaction;

                        try
                        {
                            foreach (var member in membersToParticipate)
                            {
                                // Insert into Inschrijving
                                cmd.CommandText = "INSERT INTO Inschrijving (MemberId, ActivityId, TotalPrice) VALUES (@MemberId, @ActivityId, @TotalPrice)";
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("@MemberId", member.Id);
                                cmd.Parameters.AddWithValue("@ActivityId", 1);
                                cmd.Parameters.AddWithValue("@TotalPrice", cost);

                                cmd.ExecuteNonQuery();
                            }

                            sqlTransaction.Commit();
                        }
                        catch (Exception ex)
                        {
                            sqlTransaction.Rollback();
                            throw new Exception("Error adding inschrijving", ex);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Database operation failed", ex);
            }
        }

    }
}
