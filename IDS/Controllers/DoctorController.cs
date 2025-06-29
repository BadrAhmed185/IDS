using IDS.Models.ViewModels;
using IDS.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace IDS.Controllers
{
    public class DoctorController : Controller
    {

        // service Layer of Identity
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;


        // SignInManager which creating cookie
        private readonly SignInManager<ApplicationUser> _signInManager;

        private readonly AppDbContext _context;

        public DoctorController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, RoleManager<IdentityRole> roleManager, AppDbContext context)
        {
            this._userManager = userManager;
            this._signInManager = signInManager;
            _roleManager = roleManager;
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }



        [HttpGet]
        public IActionResult SignUp()
        {
            ViewData["Clinics"] = (new SelectList(_context.Clinics, "Id", "Name"));
            ViewBag.Roles = _roleManager.Roles.Select(r => r.Name).ToList();
            return View();
        }



        [HttpPost]
        public async Task<IActionResult> SignUp(SignUpDoctorVm newUser)
        {
                    ViewData["Clinics"] = (new SelectList(_context.Clinics, "Id", "Name"));


            ViewBag.Roles = _roleManager.Roles.Select(r => r.Name).ToList();
            // ViewBag.Colleges = _context.Colleges.Select(x => x.Name).ToList();

            if (ModelState.IsValid)
            {
                // Check if the user already exists
                var existingUser = await _userManager.FindByNameAsync(newUser.UserName);
                if (existingUser != null)
                {
                    ModelState.AddModelError("", "اسم المستخدم موجود بالفعل. الرجاء اختيار اسم آخر.");
                    return View(newUser);
                }

                // Check if the Email already exists
                var existingEmail = await _userManager.FindByEmailAsync(newUser.Email);
                if (existingEmail != null)
                {
                    ModelState.AddModelError("", "البريد الإلكتروني مسجل بالفعل. الرجاء استخدام بريد إلكتروني آخر.");
                    return View(newUser);
                }


                // Check if the PhoneNumber already exists
                var existingPhoneNumber = _userManager.Users.FirstOrDefault(u => u.PhoneNumber == newUser.PhoneNumber);
                if (existingPhoneNumber != null)
                {
                    ModelState.AddModelError("", "رقم الهاتف مستخدم من قبل شخص اخر");
                    return View(newUser);
                }

                ApplicationUser userModel = new ApplicationUser
                {
                    UserName = newUser.UserName,
                    FullName = newUser.FullName,
                    NationalId = newUser.NationalId,
                    Email = newUser.Email,
                    PhoneNumber = newUser.PhoneNumber,
                    Role = newUser.Role,
                    Address = newUser.Address
                };

                Console.WriteLine($"UserName: [{newUser.UserName}]");

                IdentityResult result = await _userManager.CreateAsync(userModel, newUser.Password);

                if (!result.Succeeded)
                {
                    Console.WriteLine($"UserName: [{newUser.UserName}]");

                    foreach (var error in result.Errors)
                    {
                        Console.WriteLine($"Error Code: {error.Code}, Description: {error.Description}");
                    }
                }


                if (result.Succeeded)
                {

                    await _userManager.AddToRoleAsync(userModel, newUser.Role);

                    Doctor doctor = new Doctor
                    {
                        Id = userModel.Id,
                        ClinicId = newUser.ClinicId,
                        ActivePatientsUnderResposibility = 0,
                        Successfulcases = 0

                    };
                    _context.Add(doctor);
                    _context.SaveChanges();
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    //foreach (var error in result.Errors)
                    //  {
                    ModelState.AddModelError("", "حدث خطأ اثناء تسجيل البيانات, الرجاء مراجعة البيانات المدخله و المحاوله مرة اخري");
                    // }
                }
            }
            //Debugging: Log ModelState errors if validation fails before creating the user
            List<string> errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();

            ViewBag.errors = errors;
            ModelState.AddModelError("", "يبدو ان هناك بيانات غير صالحه, الرجاء مراجعة البيانات المدخله و المحاوله مرة اخري");
            return View(newUser); // Return the view with errors
        }



    }
}
