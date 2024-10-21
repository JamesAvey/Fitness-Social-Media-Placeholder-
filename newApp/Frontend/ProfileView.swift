import SwiftUI

// Extension to add corner radius to specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}

// Custom shape for rounding specific corners
struct RoundedCorners: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ProfileView: View {
    @State private var selectedPostType: String = "All Posts"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Profile and Stats Row
                    HStack(spacing: 20) {
                        // Profile Picture
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 60, height: 60) // Slightly smaller profile picture
                            .clipShape(Circle())
                            .padding(.leading)
                        
                        // Stats Box
                        VStack {
                            // Stats for Posts, Friends, Rivals
                            HStack(spacing: 30) {
                                statBox(number: "22", label: "Posts")
                                statBox(number: "238", label: "Friends")
                                statBox(number: "239", label: "Rivals")
                            }
                            .padding(.trailing)
                        }
                        .padding()
                        .background(Color(.darkGray))
                        .cornerRadius(10)
                    }
                    .padding(.top, 10) // Move up slightly

                    // Divider with Drop Shadow
                    Rectangle()
                        .fill(Color.gray) // Line color
                        .frame(height: 1) // Line height
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 2) // Drop shadow
                        .padding(.horizontal) // Add padding to match layout
                    
                    // Two-column layout: Progress Pics and Stats
                    HStack(spacing: 10) {
                        // Progress Pics Section (Increased height)
                        VStack(alignment: .leading) {
                            Text("Progress Pics")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            Divider()
                                .background(Color.gray)

                            // Placeholder removed, but fixed size remains
                            Rectangle()
                                .fill(Color.clear)  // No placeholder, but size is maintained
                                .frame(height: 130) // Increased height for Progress Pics
                                .cornerRadius(10)
                        }
                        .padding()
                        .background(Color(.darkGray))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity) // Ensures it takes the full width

                        // Stats Section
                        VStack(alignment: .leading) {
                            Text("Stats")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            Divider()
                                .background(Color.gray)

                            // Vertical progress bars for Squat, Bench, Deadlift
                            HStack(spacing: 20) {
                                VStack {
                                    Text("Squat").font(.caption).foregroundColor(.white)
                                    verticalProgressBar(progress: 0.7)
                                }
                                VStack {
                                    Text("Bench").font(.caption).foregroundColor(.white)
                                    verticalProgressBar(progress: 0.5)
                                }
                                VStack {
                                    Text("Deadlift").font(.caption).foregroundColor(.white)
                                    verticalProgressBar(progress: 0.8)
                                }
                            }
                            .padding(.top, 10)
                        }
                        .padding()
                        .background(Color(.darkGray))
                        .cornerRadius(10)
                        .frame(height: 180) // Keep Stats height unchanged
                    }
                    .frame(height: 180) // Fixed height for both boxes

                    // All Posts Section (Taking up half the height of the page)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("All Posts")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()

                            // Dropdown menu for post types
                            Menu {
                                Button(action: {
                                    selectedPostType = "All Posts"
                                }) {
                                    Text("All Posts")
                                }
                                Button(action: {
                                    selectedPostType = "Progress Pictures"
                                }) {
                                    Text("Progress Pictures")
                                }
                            } label: {
                                Label(selectedPostType, systemImage: "chevron.down")
                                    .foregroundColor(.white)
                            }
                        }

                        Divider()
                            .background(Color.gray)

                        // Placeholder removed, but fixed size remains
                        Rectangle()
                            .fill(Color.clear)  // No placeholder, but size is maintained
                            .cornerRadius(10)
                    }
                    .padding()
                    .background(Color(.darkGray))
                    .cornerRadius(10)
                    .frame(height: 250) // Fixed height for All Posts box
                }
                .padding()
            }
            .background(Color(red: 0.15, green: 0.15, blue: 0.15)) // Subtle black/grey background
        }
    }

    // Function to create the stat box
    private func statBox(number: String, label: String) -> some View {
        VStack {
            Text(number)
                .font(.system(size: 22))
                .bold()
                .foregroundColor(.white)
            Text(label)
                .font(.callout)
                .foregroundColor(.gray)
        }
    }

    // Function to create a thicker vertical progress bar
    private func verticalProgressBar(progress: CGFloat) -> some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottom) {
                    // Background for the progress bar
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 20, height: geometry.size.height)
                        .cornerRadius(4)
                    // The actual progress
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 20, height: geometry.size.height * progress)
                        .cornerRadius(4)
                }
            }
        }
        .frame(width: 20, height: 100) // Adjust bar height
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

