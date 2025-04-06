namespace IDS
{
    public class MyAmazingNotesToRemember
    {

        /////////////Important notes About null
        #region
        ////////////////Important about null : 
        // var tickets = _context.Tickets; // ✅ This is an IQueryable<Ticket>, not a list! This does not retrieve any data immediately.    
        //  The query only executes when you iterate over it(e.g., using .ToList(), .FirstOrDefault(), etc.).

        //ToList() returns a list(empty or filled)
        //FirstOrDefault() returns a single object(or null if nothing is found)


        // What Happens When There’s No Match?
        //Query                                                         Return Type                                            What It Returns If No Match?
        //_context.Tickets.Where(e => e.Id == id);                      IQueryable<Ticket>                                     An empty queryable(not null)
        //_context.Tickets.Where(e => e.Id == id).ToList();             List<Ticket>                                           An empty list[]

        //_context.Tickets.Select(e => e.Id);                           IQueryable<int>                                        Empty queryable(not null)
        //_context.Tickets.Select(e => e.Id).ToList();                  List<int> Empty                                        list[](not null)

        //_context.Tickets.FirstOrDefault(e => e.Id == id);             Ticket ?                                                (nullable)null
        //_context.Tickets.SingleOrDefault(e => e.Id == id);            Ticket ?                                                (nullable)null(if no match), Exception(if multiple matches)

        #endregion



        #region
        //,, important about db ;loading , queries and data reader
        //  .ToList() retrieves all tickets from the database and loads them into memory.
        // .FirstOrDefault(t => t.TicketId == id) filters the list in memory to find the first matching record



        // ✅ Fix: Remove.ToList() and use FirstOrDefaultAsync() instead.
        // When you use.ToList(), EF keeps the DataReader open while it loads all records.
        //If your database has 100,000 tickets, all of them are loaded into memory even though you only need one!
        //This wastes memory and slows down performance.
        //It increases database load and can lead to higher RAM usage in large systems.

        //Missing await for database operations
        //Since you're inside an async action, database queries should use await with FirstOrDefaultAsync() to avoid blocking the thread.
        #endregion


        // Wrong code 
        //var ticket = _context.Tickets
        //.AsNoTracking()

        //.Include(t => t.MedicalHistory)
        //.Include(t => t.Patient)
        //.Include(t => t.ReferredTo)
        //.ToList()
        //.FirstOrDefault(t => t.TicketId == id); // ✅ Use ToList()

        //var ticket = await _context.Tickets
        //    .AsNoTracking()
        //    .Include(t => t.MedicalHistory)
        //    .Include(t => t.Patient)
        //    .Include(t => t.ReferredTo)
        //    .FirstOrDefaultAsync(t => t.TicketId == id); // ✅ Use FirstOrDefaultAsync
    }
}
