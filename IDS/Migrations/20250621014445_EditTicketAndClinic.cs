using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace IDS.Migrations
{
    /// <inheritdoc />
    public partial class EditTicketAndClinic : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ClinicId",
                table: "Tickets",
                type: "int",
                nullable: true
               );

            migrationBuilder.AddColumn<string>(
                name: "ArabicName",
                table: "Clinics",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_ClinicId",
                table: "Tickets",
                column: "ClinicId");

            migrationBuilder.AddForeignKey(
                name: "FK_Tickets_Clinics_ClinicId",
                table: "Tickets",
                column: "ClinicId",
                principalTable: "Clinics",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tickets_Clinics_ClinicId",
                table: "Tickets");

            migrationBuilder.DropIndex(
                name: "IX_Tickets_ClinicId",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "ClinicId",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "ArabicName",
                table: "Clinics");
        }
    }
}
