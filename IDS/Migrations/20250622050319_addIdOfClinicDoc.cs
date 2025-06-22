using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace IDS.Migrations
{
    /// <inheritdoc />
    public partial class addIdOfClinicDoc : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ClinicDocId",
                table: "ticketAccountancies",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ticketAccountancies_ClinicDocId",
                table: "ticketAccountancies",
                column: "ClinicDocId");

            migrationBuilder.AddForeignKey(
                name: "FK_ticketAccountancies_AspNetUsers_ClinicDocId",
                table: "ticketAccountancies",
                column: "ClinicDocId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                 onDelete: ReferentialAction.NoAction);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ticketAccountancies_AspNetUsers_ClinicDocId",
                table: "ticketAccountancies");

            migrationBuilder.DropIndex(
                name: "IX_ticketAccountancies_ClinicDocId",
                table: "ticketAccountancies");

            migrationBuilder.DropColumn(
                name: "ClinicDocId",
                table: "ticketAccountancies");
        }
    }
}
