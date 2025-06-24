using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace IDS.Migrations
{
    /// <inheritdoc />
    public partial class NoRiskNoFun : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // 1. Drop Foreign Keys
            migrationBuilder.DropForeignKey(
                name: "FK_MedicalHistories_Tickets_Id",
                table: "MedicalHistories");

            migrationBuilder.DropForeignKey(
                name: "FK_MedicalHistories_patients_PatientId",
                table: "MedicalHistories");

            // 2. Drop Index
            migrationBuilder.DropIndex(
                name: "IX_MedicalHistories_PatientId",
                table: "MedicalHistories");

            // 3. Drop Column
            migrationBuilder.DropColumn(
                name: "PatientId",
                table: "MedicalHistories");

            // 4. Drop Primary Key (important!)
            migrationBuilder.DropPrimaryKey(
                name: "PK_MedicalHistories",
                table: "MedicalHistories");

            // 5. Alter Column
            migrationBuilder.AlterColumn<string>(
                name: "Id",
                table: "MedicalHistories",
                type: "nvarchar(14)", // Target type
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            // 6. Add Primary Key back
            migrationBuilder.AddPrimaryKey(
                name: "PK_MedicalHistories",
                table: "MedicalHistories",
                column: "Id");

            // 7. Add Foreign Key to patients
            migrationBuilder.AddForeignKey(
                name: "FK_MedicalHistories_patients_Id",
                table: "MedicalHistories",
                column: "Id",
                principalTable: "patients",
                principalColumn: "PatientId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MedicalHistories_patients_Id",
                table: "MedicalHistories");

            migrationBuilder.AlterColumn<string>(
                name: "Id",
                table: "MedicalHistories",
                type: "nvarchar(450)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(14)");

            migrationBuilder.AddColumn<string>(
                name: "PatientId",
                table: "MedicalHistories",
                type: "nvarchar(14)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_MedicalHistories_PatientId",
                table: "MedicalHistories",
                column: "PatientId");

            migrationBuilder.AddForeignKey(
                name: "FK_MedicalHistories_Tickets_Id",
                table: "MedicalHistories",
                column: "Id",
                principalTable: "Tickets",
                principalColumn: "TicketId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MedicalHistories_patients_PatientId",
                table: "MedicalHistories",
                column: "PatientId",
                principalTable: "patients",
                principalColumn: "PatientId");
        }
    }
}
