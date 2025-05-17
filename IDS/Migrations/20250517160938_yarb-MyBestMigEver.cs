using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace IDS.Migrations
{
    /// <inheritdoc />
    public partial class yarbMyBestMigEver : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    NationalId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FullName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Role = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    Email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "patients",
                columns: table => new
                {
                    PatientId = table.Column<string>(type: "nvarchar(14)", maxLength: 14, nullable: false),
                    Name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Address = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    profession = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    phoneNumber = table.Column<string>(type: "nvarchar(11)", maxLength: 11, nullable: false),
                    Gender = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Age = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_patients", x => x.PatientId);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderKey = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Tickets",
                columns: table => new
                {
                    TicketId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    PatientId = table.Column<string>(type: "nvarchar(14)", nullable: false),
                    AppointmentDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ChiefComlant = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: false),
                    PrevisionalDiagnosis = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: false),
                    NextDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsValid = table.Column<bool>(type: "bit", nullable: false),
                    LevelOfCompletness = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tickets", x => x.TicketId);
                    table.ForeignKey(
                        name: "FK_Tickets_patients_PatientId",
                        column: x => x.PatientId,
                        principalTable: "patients",
                        principalColumn: "PatientId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Asnans",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    tooth11 = table.Column<bool>(type: "bit", nullable: false),
                    tooth12 = table.Column<bool>(type: "bit", nullable: false),
                    tooth13 = table.Column<bool>(type: "bit", nullable: false),
                    tooth14 = table.Column<bool>(type: "bit", nullable: false),
                    tooth15 = table.Column<bool>(type: "bit", nullable: false),
                    tooth16 = table.Column<bool>(type: "bit", nullable: false),
                    tooth17 = table.Column<bool>(type: "bit", nullable: false),
                    tooth18 = table.Column<bool>(type: "bit", nullable: false),
                    tooth21 = table.Column<bool>(type: "bit", nullable: false),
                    tooth22 = table.Column<bool>(type: "bit", nullable: false),
                    tooth23 = table.Column<bool>(type: "bit", nullable: false),
                    tooth24 = table.Column<bool>(type: "bit", nullable: false),
                    tooth25 = table.Column<bool>(type: "bit", nullable: false),
                    tooth26 = table.Column<bool>(type: "bit", nullable: false),
                    tooth27 = table.Column<bool>(type: "bit", nullable: false),
                    tooth28 = table.Column<bool>(type: "bit", nullable: false),
                    tooth31 = table.Column<bool>(type: "bit", nullable: false),
                    tooth32 = table.Column<bool>(type: "bit", nullable: false),
                    tooth33 = table.Column<bool>(type: "bit", nullable: false),
                    tooth34 = table.Column<bool>(type: "bit", nullable: false),
                    tooth35 = table.Column<bool>(type: "bit", nullable: false),
                    tooth36 = table.Column<bool>(type: "bit", nullable: false),
                    tooth37 = table.Column<bool>(type: "bit", nullable: false),
                    tooth38 = table.Column<bool>(type: "bit", nullable: false),
                    tooth41 = table.Column<bool>(type: "bit", nullable: false),
                    tooth42 = table.Column<bool>(type: "bit", nullable: false),
                    tooth43 = table.Column<bool>(type: "bit", nullable: false),
                    tooth44 = table.Column<bool>(type: "bit", nullable: false),
                    tooth45 = table.Column<bool>(type: "bit", nullable: false),
                    tooth46 = table.Column<bool>(type: "bit", nullable: false),
                    tooth47 = table.Column<bool>(type: "bit", nullable: false),
                    tooth48 = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Asnans", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Asnans_Tickets_Id",
                        column: x => x.Id,
                        principalTable: "Tickets",
                        principalColumn: "TicketId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MedicalHistories",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    HeartTrouble = table.Column<bool>(type: "bit", nullable: false),
                    Hyperttention = table.Column<bool>(type: "bit", nullable: false),
                    Pregnancy = table.Column<bool>(type: "bit", nullable: false),
                    Diabetes = table.Column<bool>(type: "bit", nullable: false),
                    Hepatitis = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    AIDs = table.Column<bool>(type: "bit", nullable: false),
                    Tuberculosis = table.Column<bool>(type: "bit", nullable: false),
                    Allergies = table.Column<bool>(type: "bit", nullable: false),
                    Anemia = table.Column<bool>(type: "bit", nullable: false),
                    Rheumatism = table.Column<bool>(type: "bit", nullable: false),
                    RadTherapy = table.Column<bool>(type: "bit", nullable: false),
                    Haemophilia = table.Column<bool>(type: "bit", nullable: false),
                    AspirinIntake = table.Column<bool>(type: "bit", nullable: false),
                    KidneyTroubles = table.Column<bool>(type: "bit", nullable: false),
                    Asthma = table.Column<bool>(type: "bit", nullable: false),
                    HayFever = table.Column<bool>(type: "bit", nullable: false),
                    MedicalHistoryText = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MedicalHistories", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MedicalHistories_Tickets_Id",
                        column: x => x.Id,
                        principalTable: "Tickets",
                        principalColumn: "TicketId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ReferredTo",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Oral = table.Column<bool>(type: "bit", nullable: false),
                    RemovableProsth = table.Column<bool>(type: "bit", nullable: false),
                    Operative = table.Column<bool>(type: "bit", nullable: false),
                    Endodontic = table.Column<bool>(type: "bit", nullable: false),
                    Ortho = table.Column<bool>(type: "bit", nullable: false),
                    CrownAndBridge = table.Column<bool>(type: "bit", nullable: false),
                    Surgery = table.Column<bool>(type: "bit", nullable: false),
                    Pedo = table.Column<bool>(type: "bit", nullable: false),
                    XRay = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ReferredTo", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ReferredTo_Tickets_Id",
                        column: x => x.Id,
                        principalTable: "Tickets",
                        principalColumn: "TicketId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ticketAccountancies",
                columns: table => new
                {
                    TicketId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ReceptionEmpId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    DiagnosisDocId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ticketAccountancies", x => x.TicketId);
                    table.ForeignKey(
                        name: "FK_ticketAccountancies_AspNetUsers_DiagnosisDocId",
                        column: x => x.DiagnosisDocId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_ticketAccountancies_AspNetUsers_ReceptionEmpId",
                        column: x => x.ReceptionEmpId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ticketAccountancies_Tickets_TicketId",
                        column: x => x.TicketId,
                        principalTable: "Tickets",
                        principalColumn: "TicketId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_ticketAccountancies_DiagnosisDocId",
                table: "ticketAccountancies",
                column: "DiagnosisDocId");

            migrationBuilder.CreateIndex(
                name: "IX_ticketAccountancies_ReceptionEmpId",
                table: "ticketAccountancies",
                column: "ReceptionEmpId");

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_PatientId",
                table: "Tickets",
                column: "PatientId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Asnans");

            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "MedicalHistories");

            migrationBuilder.DropTable(
                name: "ReferredTo");

            migrationBuilder.DropTable(
                name: "ticketAccountancies");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "Tickets");

            migrationBuilder.DropTable(
                name: "patients");
        }
    }
}
