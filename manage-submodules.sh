#!/bin/bash

# Bank Asset & HR Management System - Submodules Manager
# This script helps manage Git submodules for the project

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

# Function to show usage
show_usage() {
    cat << EOF
Bank Asset & HR Management System - Submodules Manager

Usage: $0 [COMMAND]

Commands:
    init        Initialize all submodules
    update      Update all submodules to latest
    status      Show submodule status
    clone       Clone submodule repositories (when using remote repos)
    clean       Clean untracked files in submodules
    reset       Reset all submodules to known good state
    help        Show this help message

Current submodules:
    - core-framework: Authentication, DB, security components
    - inventory-system: Asset management and procurement
    - hrm-system: Human resources and payroll
    - finance-system: Administrative workflows
    - frontend-assets: CSS, JS, and media files

EOF
}

# Function to check if .gitmodules exists
check_gitmodules() {
    if [ ! -f ".gitmodules" ]; then
        print_error ".gitmodules file not found!"
        print_info "Make sure you're in the project root directory."
        exit 1
    fi
}

# Function to initialize submodules
init_submodules() {
    print_info "Initializing Git submodules..."
    git submodule init
    git submodule update --init --recursive
    print_status "Submodules initialized successfully."
}

# Function to update submodules
update_submodules() {
    print_info "Updating all submodules to latest..."
    git submodule update --remote --merge
    print_status "Submodules updated successfully."
}

# Function to show status
show_status() {
    print_info "Checking submodule status..."
    echo ""
    git submodule status
    echo ""
    print_info "For detailed information:"
    echo "  git submodule"
    echo "  git submodule foreach --recursive git status"
}

# Function to clone repositories (for remote repos)
clone_submodules() {
    print_info "This command is for setting up remote repositories."
    print_info "Currently using local submodule paths."
    print_info "To use remote repositories:"
    print_info "1. Create separate Git repositories for each submodule"
    print_info "2. Update .gitmodules with remote URLs"
    print_info "3. Run: git submodule sync"
    print_info "4. Run: git submodule update --init --recursive"
}

# Function to clean submodules
clean_submodules() {
    print_warning "Cleaning untracked files in all submodules..."
    git submodule foreach git clean -fd
    git submodule foreach git reset --hard
    print_status "Submodules cleaned."
}

# Function to reset submodules
reset_submodules() {
    print_warning "Resetting all submodules to main branch..."
    git submodule foreach git checkout main
    git submodule foreach git pull origin main
    print_status "Submodules reset to main branch."
}

# Main script logic
case "${1:-help}" in
    init)
        check_gitmodules
        init_submodules
        ;;
    update)
        check_gitmodules
        update_submodules
        ;;
    status)
        check_gitmodules
        show_status
        ;;
    clone)
        clone_submodules
        ;;
    clean)
        check_gitmodules
        clean_submodules
        ;;
    reset)
        check_gitmodules
        reset_submodules
        ;;
    help|--help|-h)
        show_usage
        ;;
    *)
        print_error "Unknown command: $1"
        echo ""
        show_usage
        exit 1
        ;;
esac
