using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace IDS.Migrations
{
    /// <inheritdoc />
    public partial class smallMod : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Supervisor",
                table: "Clinics",
                type: "nvarchar(450)",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.CreateIndex(
                name: "IX_Clinics_Supervisor",
                table: "Clinics",
                column: "Supervisor");

            migrationBuilder.AddForeignKey(
                name: "FK_Clinics_AspNetUsers_Supervisor",
                table: "Clinics",
                column: "Supervisor",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.NoAction);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Clinics_AspNetUsers_Supervisor",
                table: "Clinics");

            migrationBuilder.DropIndex(
                name: "IX_Clinics_Supervisor",
                table: "Clinics");

            migrationBuilder.AlterColumn<int>(
                name: "Supervisor",
                table: "Clinics",
                type: "int",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");
        }
    }
}
