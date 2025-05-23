﻿using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace IDS.Migrations
{
    /// <inheritdoc />
    public partial class EditTicketAccountanct : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ticketAccountancies_AspNetUsers_DiagnosisDocId",
                table: "ticketAccountancies");

            migrationBuilder.AlterColumn<string>(
                name: "DiagnosisDocId",
                table: "ticketAccountancies",
                type: "nvarchar(450)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.AddForeignKey(
                name: "FK_ticketAccountancies_AspNetUsers_DiagnosisDocId",
                table: "ticketAccountancies",
                column: "DiagnosisDocId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ticketAccountancies_AspNetUsers_DiagnosisDocId",
                table: "ticketAccountancies");

            migrationBuilder.AlterColumn<string>(
                name: "DiagnosisDocId",
                table: "ticketAccountancies",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(450)",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_ticketAccountancies_AspNetUsers_DiagnosisDocId",
                table: "ticketAccountancies",
                column: "DiagnosisDocId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
